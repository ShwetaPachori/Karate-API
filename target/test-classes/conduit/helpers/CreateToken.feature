Feature: Test create token

       Scenario: create token
              Given url ApiUrl
              Given path 'users/login'
              And request {"user":{"email":"#(email)","password":"#(password)"}}
              When method POST
              Then status 200
              * def authToken = response.user.token