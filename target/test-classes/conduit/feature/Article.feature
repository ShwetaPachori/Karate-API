@debug
    Feature: Test Article

        Background: Define URL
            Given url ApiUrl
            * def responseToken = callonce read('classpath:src/test/java/conduit/helpers/CreateToken.feature')
            * def token = responseToken.authToken

            Scenario:Create Article
            Given header Authorization = 'Token ' + token
            Given path 'articles'
            And request {"article":{"tagList":[],"title":"Testing","description":"This  Article is for testing","body":"Test class"}}
            When method POST
            Then status 200
            Then match response.article.title == 'Testing'

        
            Scenario:Delete Article
            Given header Authorization = 'Token ' + token
            Given path 'articles'
            And request {"article":{"tagList":[],"title":"Delete","description":"This  Article is for testing","body":"Test class"}}
            When method POST
            Then status 200
            Then match response.article.title == 'Delete'
            * def articleId = response.article.slug

            Given params {limit:10 ,offset:0}
            Given path 'articles'
            When method GET
            Then status 200
            Then match response.articles[0].title == 'Delete'

            Given header Authorization = 'Token ' + token
            Given path 'articles',articleId
            When method Delete
            Then status 200

            Given params {limit:10 ,offset:0}
            Given path 'articles'
            When method GET
            Then status 200
            Then match response.articles[0].title != 'Delete'
