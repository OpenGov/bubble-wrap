Feature: Network filters

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  @frictionless
  Scenario: Displaying of population frequency
    Then I should see the population frequency displayed above the slider

  @frictionless
  Scenario: Displaying of revenue range frequency
    Then I should see the revenue range frequency displayed above the slider

  @frictionless
  Scenario: Typing characters in the filter
    When I type characters in search field
    Then I should see updated list of entities in the list

  @frictionlesse
  Scenario: Filtering by organization type
    When I filter entities by organization type
    Then I should only see entities of the selected organization type

  @frictionless
  Scenario: Searching for a specific entity
    When I type a specific entity in search field
    Then I should see this entity in the list of entities