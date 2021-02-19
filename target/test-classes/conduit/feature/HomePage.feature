Feature: Test Home Page

    Background: Define URL
        Given url 'https://conduit.productionready.io/api/'

    Scenario:Get all tags
        Given path 'tags'
        When method GET
        Then status 200
        And match response.tags contains ['HITLER','SIDA']

# Request with param
    Scenario: Get all tags
        # Given param limit = 10 
        Given params {limit:10 ,offset:0}
        Given path 'articles'
        When method GET
        Then status 200
