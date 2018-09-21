Feature: Network List of Results

  Background:
    Given I am logged as an entity user
    And I go to network from reports page
    When I select an 'Alameda' entity from the list

  @frictionless
  Scenario: Selecting an entity displays the information in the other panels quickly
    Then I should see the information in the other panels

  @accurate
  Scenario: Selecting an entity from the list displays the card for the entity
    Then I should see the card for the entity

  @frictionless
  Scenario: Selecting an entity from the list displays the region that includes the entity
    Then I should see the region of 'Alameda' entity

  @frictionless
  Scenario: Selecting an entity from the list draws a vertical bar on the population frequency
    Then I should see a vertical bar on the 'Population' frequency

  @frictionless
  Scenario: Selecting an entity from the list draws a vertical bar on the generate fund revenue frequency
    Then I should see a vertical bar on the 'General Fund Revenue' frequency
