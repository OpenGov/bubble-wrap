@accurate @bug
Feature: Network filters by population

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  Scenario: Select population range with sliders from zero to middle
    When I select a population range from 0 to 10k
    And I sort by decrease the list of entities by population
    Then I should only see entities with populations from 0 to 10k

  Scenario: Select population range with sliders inside
    When I select a population range from 10k to 100k
    And I sort by decrease the list of entities by population
    Then I should only see entities with populations from 10k to 100k

  @bug
  Scenario: Select population range with sliders from middle to max
    When I select a population range from 1m to max
    And I sort by decrease the list of entities by population
    Then I should only see entities with populations from 1m to max
