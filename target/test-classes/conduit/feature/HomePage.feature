Feature: Test Home Page

    Background: Define URL
        Given url ApiUrl
    
   
    Scenario:Get all tags
        Given path 'tags'
        When method GET
        Then status 200
        And match response.tags contains ['HITLER','SIDA']
        And match response.tags !contains 'trucks'
        And match response.tags == "#array"
        And match each response.tags =="#string"
    

# Request with param
    Scenario: Get all tags
        # Given param limit = 10 
        Given params {limit:10 ,offset:0}
        Given path 'articles'
        When method GET
        Then status 200
        And match response.articles == "#[10]"
        And match response.articlesCount == 500
