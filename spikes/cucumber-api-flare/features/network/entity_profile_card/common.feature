Feature: Entity profile card

  Background:
    Given I am logged as an entity user
    And I go to network from reports page

  @frictionless
  Scenario: The card has the network-visible reports
    When I select 'Livingston, MT, US' entity from the map
    Then I should see the expected network-visible reports

  @frictionless
  Scenario: Mousing over a stat displays the source of the statistic
    When I select 'Livingston, MT, US' entity from the map
    And I hover over a 'General Fund Gross Revenues' stat
    Then I should see the source of the statistic

  @frictionless
  Scenario: Hide or minimize the card
    When I select an entity from the map
    And I hide the entity card
    Then I should see small card for the entity

  @frictionless
  Scenario: Close the card
    When I select an entity from the map
    And I close the entity card
    Then I shouldn't see the card for the entity

  @interoperability_functionality
  Scenario: Entity must have an "annual report"
    When I select 'Livingston, MT, US' entity from the map
    Then I should see 'Annual' report in the entity card

  @interoperability_functionality
  Scenario: Selecting the report displays the report
    When I select 'Livingston, MT, US' entity from the map
    And I select 'Annual' report from the entity card
    Then I should see 'Annual' report
