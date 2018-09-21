@frictionless
Feature: Entity profile card (frictionless)

  Background:
    Given I am logged as an entity user
    And I go to network from reports page
    When I select 'Livingston, MT, US' entity from the map

  Scenario: The link in the entity card takes the user to the web site of that link
    When I open the web site from the entity card
    Then I should see this web site

  @wip
  Scenario: Displays city information from Wikipedia
    Then I should see city information from Wikipedia

  Scenario: Map still displays the entity after closing the card
    When I close the entity card
    Then I should see this entity at the map
