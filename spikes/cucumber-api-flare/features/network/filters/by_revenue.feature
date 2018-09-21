@accurate @bug
Feature: Network filters by revenue

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  @bug
  Scenario: Select revenue range with sliders from zero to middle
    When I select a revenue range from 0 to 1m
    And I sort by decrease the list of entities by revenue
    Then I should only see entities with revenues from 0 to 1m

  @bug
  Scenario: Select revenue range with sliders inside
    When I select a revenue range from 1m to 100m
    And I sort by decrease the list of entities by revenue
    Then I should only see entities with revenues from 1m to 10m

  Scenario: Select revenue range with sliders from middle to max
    When I select a revenue range from 100m to max
    And I sort by decrease the list of entities by revenue
    Then I should only see entities with revenues from 100m to max