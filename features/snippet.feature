Feature: Snippet life cycle

  Scenario: Creating a snippet
    Given I am authenticated
    When I go to the new snippet page
    And I fill in the snippet creation form
    Then I should see a "success" message
    And I should see my snippets page

  Scenario: Updating a snippet
    Given I am authenticated
    When I go to my snippets page
    And I click edit on a snippet
    And I fill in the snippet edit form
    Then I should see a "update success" message
    And I should see my snippet page

  @javascript
  Scenario: Deleting a snippet
    Given I am authenticated
    When I go to my snippets page
    And I click delete on a snippet
    And I click ok on the confirm box
    Then I should see a "update delete" message
    And I should see snippets page

  Scenario: Displaying a snippet
    Given I am on the home page
    When I click show on a snippet
    Then I should see this snippet details

  Scenario: Displaying my snippets
    Given I am authenticated
    When I go to my snippets page
    Then I should see only my snippets
