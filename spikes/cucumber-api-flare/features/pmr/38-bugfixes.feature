@good
Feature: Bugfixes

 
  @PMR-473 @assignee:jmcinerney @COMPLETED
  Scenario: Tile not updating with latest month

    Given I am an entity admin
    And there is a dashboard with a grid report tile
    When I visit the dashboard
    And I count the months in the tile
    And I view the tile report
    Then I see the tile has the same number of months as the report


  @ORPHAN
  Scenario: Cannot create per capita tiles

    Given I am an entity admin
    And there is a per capita save view
    When I visit the dashboard
    And I make a tile using the saved view
    Then I see the tile

