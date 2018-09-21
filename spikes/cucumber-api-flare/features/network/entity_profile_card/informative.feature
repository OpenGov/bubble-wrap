@informative
Feature: Entity profile card (informative)

  Background:
    Given I am logged as an entity user
    And I go to network from reports page
    When I select 'Livingston, MT, US' entity from the map

  Scenario: Displays general fund gross revenues
    Then I should see 'General Fund Gross Revenues' metric

  Scenario: Displays land area
    Then I should see 'Land Area (sq. mi.)' metric

  Scenario: Displays population served
    Then I should see 'Population Served' metric

  Scenario: Displays Median Household Incomev
    Then I should see 'Median Household Income' metric

  Scenario: Displays Unemployment rate
    Then I should see 'Unemployment Rate' metric
