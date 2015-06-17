Feature: Authentication
  Scenario: Creating a new user account
    Given I am not authenticated
    When I go to signup page
    And I fill in registration form
    Then I should see a success signup message

  Scenario: Signing in
    Given I am a registered user
    When I go to the signin page
    And I fill in the signin form
    Then I should see a success signin message

  Scenario: Signing out
    Given I am signed in 
    When I click the signout link
    Then I should see a success signout message

  Scenario: Incorrect registration
    Given I am not authenticated
    When I go to signup page
    And I fill in registration form with incorrect data
    Then I should see a registration error

  Scenario: Incorrect login
    Given I am a registered user
    When I go to the signin page
    And I fill in the signin form with incorrect data
    Then I should see a signin error
