Feature: Snippet life cycle

    Scenario: Creating a snippet
        Given I am authenticated
        When I fill in the snippet creation form
        Then I should see a success message
        And I should see my snippets page
