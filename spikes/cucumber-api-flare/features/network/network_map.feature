Feature: Network Map

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  @frictionless
  Scenario: Viewing a map of entities is centered in the frame
    Then the map should be centered in the panel

  @frictionless
  Scenario: User can zoom in on a collection of entities
    When I select a target with the biggest entities
    Then the map should zoom to show the entities in the target

  @frictionless
  Scenario: View a map of entities
    Then I should see a map with entities

  @frictionless
  Scenario: Click on the map to see more information
    When I select an entity from the map
    Then I should see a card with entity information

  @accurate
  Scenario: User is able to view the details about a specific entity
    When I select 'Livingston, MT, US' entity from the map
    Then I should see the expected entity details
