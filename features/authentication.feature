Feature: Authentication

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to signup
    And I fill in "user_email" with "<email>"
    And I fill in "user_username" with "<username>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I click "Sign up" button
    Then I should see "Welcome! You have signed up successfully."

    Examples:
        | email                   | password         | username |
        | landry.soules@gmail.com | mydummypassword1 | landry   |
        | landry@spaceinvade.rs   | mydummypassword2 | skaboss  |
