Feature: Home page

  Scenario: Viewing application's home page
    Given there's a snipet titled "My first snipet" with "ls" content
    When I am on the homepage
    Then I should see the "My first snipet" snipet
