Feature: Starring snippets
  In order to give snippets rating
  As an authenticated user
  I can give snippets a star

  Background:
    Given I am authenticated
    And there is at least one snippet in the system

  @javascript
  Scenario: Giving a snippet a star
    Given I am on a snippet page
    When I click the star icon
    Then the stars counter for this snippet should increment
    And the star icon should become yellow

  @javascript
  Scenario: Removing a star from a snippet
    Given I am on a snippet page
    And I already gave this snippet a star
    When I click the star icon
    Then the stars counter for this snippet should decrease
    And the star icon should become grey

  Scenario: Watching my starred snippets
    Given I am anywhere in the site
    When I click on my starred snippets link
    Then I should see all the snippets I have given a star
