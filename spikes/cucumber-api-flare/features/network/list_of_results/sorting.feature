@accurate
Feature: Sorting Network List of Results

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  Scenario: Sorting by decrease by population
    When I sort by decrease the list of entities by population
    Then I should see the list of entities sorted by decrease by population

  Scenario: Sorting by increase by population
    When I sort by increase the list of entities by population
    Then I should see the list of entities sorted by increase by population

  Scenario: Sorting by decrease by revenue
    When I sort by decrease the list of entities by revenue
    Then I should see the list of entities sorted by decrease by revenue

  Scenario: Sorting by increase by revenue
    When I sort by increase the list of entities by revenue
    Then I should see the list of entities sorted by increase by revenue

  Scenario: Sorting by decrease by name
    When I sort by decrease the list of entities by name
    Then I should see the list of entities sorted by decrease by name

  Scenario: Sorting by increase by name
    When I sort by increase the list of entities by name
    Then I should see the list of entities sorted by increase by name