@wip
Feature: YoY Budget vs Actuals Tile


  Background:
    Given I am an entity admin
    And I visit the dashboard gallery

 
  @PMR-109 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Entity Admin can see advanced modal button in a grid report tile

    When I edit a grid report tile
    Then I see the Advanced mode capability


  @PMR-109 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Entity User can see advanced modal button in a YoY tile

    When I edit a YoY tile
    Then I see the Advanced mode capability


  @PMR-109 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Ability to use Advanced capabilities

    When I edit a YoY tile
    And I use the Advanced mode
    Then I should see the Advanced capabilities


  @ORPHAN
  Scenario: User sees the Advanced button on window larger than the minimum

    When the window is greater than or equal to 790px
    And I edit a tile 
    Then I see the Advanced mode capability


  @PMR-109 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: User does not see Advanced button on window smaller than the minimum

    Given the window is less than than 790px
    When I edit a YoY tile 
    Then I do not see the Advanced mode capability


  @PMR-109 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: User can delete tile from advanced edit tile modal

    When I edit a tile
    And I use the Advanced mode
    And I delete the tile
    Then I see the tile has been deleted

