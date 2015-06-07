Feature: Snippet life cycle

  Background:
    Given several registered users have already created snipets

  Scenario: Creating a snippet
    Given I am authenticated
    When I go to the new snippet page
    And I fill in the snippet creation form
    Then I should see that my snippet is successfully created

  Scenario: Updating a snippet
    Given I am authenticated
    When I go to my snippets page
    And I click edit on a snippet
    And I fill in the snippet edit form
    Then I should see that my snippet is successfully updated

  @javascript
  Scenario: Deleting a snippet
    Given I am authenticated
    When I go to my snippets page
    And I click delete on a snippet
    And I click ok on the confirm box
    Then I should see that my snippet is successfully deleted

  Scenario: Displaying a snippet
    Given I am on the home page
    When I click show on a snippet
    Then I should see this snippet details

  Scenario: Displaying my snippets
    Given I am authenticated
    When I go to my snippets page
    Then I should see only my snippets

  Scenario: Displaying all snippets
    Given I am an anonymous user
    When I go to the snippets page
    Then I should see all snippets

  Scenario: Running a snippet
    Given I am an anonymous user
    When I click show on a snippet
    When I click execute
    Then I should see the command output

