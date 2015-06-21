@star
Feature: Commenting snippets
  In order to comment snippets
  As an authenticated user
  I can comment a snippet

  Background:
    Given I am authenticated

  Scenario: Commenting a snippet from the snippet page
    Given I am on a snippet page
    When I click the comment button
    Then I fill in a comment form popup window
    And my comment is added to the snippet's comments
    And the comments counter is increased on the snippet page
    And the comments counter is increased on the snippet panel
