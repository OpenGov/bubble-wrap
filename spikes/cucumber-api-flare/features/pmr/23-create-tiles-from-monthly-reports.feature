Feature: Create Tiles from Monthly Reports

 
  @ORPHAN
  Scenario: Create MoM Tile

    Given I am an entity admin
    And I have created a dashboard
    And I visit the dashboard
    When I create a MoM tile
    Then I can see the new tile


  @ORPHAN
  Scenario: Create YoY Tile

    Given I am an entity admin
    And I have created a dashboard
    And I visit the dashboard
    When I create a YoY tile
    Then I can see the new tile

