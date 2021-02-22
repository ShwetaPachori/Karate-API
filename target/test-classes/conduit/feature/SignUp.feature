Feature: Test Home Page

    Background: Define URL
        Given url ApiUrl
    
   
    Scenario:Sign Up
        Given def userData = {"email":"karateUserZXC@gmail.com","username":"KarateZXC"}

        Given path 'users'
        And request
        """
            {
                "user": {
                    "email": #(userData.email),
                    "password": "qwert12345",
                    "username": #(userData.username)
                }
            }
        """
        When method POST
        Then status 200