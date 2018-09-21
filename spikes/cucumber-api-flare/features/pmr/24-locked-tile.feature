@bug
Feature: Locked Tile

 
  @PMR-296 @assignee:renee.kim @version:Private_Dashboards @COMPLETED
  Scenario: Entity user should see locked tile on a private report tile

    Given I am an entity user
    And there is a dashboard with a private report tile
    When I visit the dashboard
    Then there should be a locked tile on the private report tile
    And there should not be an edit tile on the private report tile


  @PMR-296 @assignee:renee.kim @version:Private_Dashboards @COMPLETED
  Scenario: Entity admin should see locked tile on a private report tile

    Given I am an entity admin
    And there is a dashboard with a private report tile
    When I visit the dashboard
    Then there should be a locked tile on the private report tile
    And there should not be an edit tile on the private report tile

