@wip
Feature: Grid Report Tiles: Toggle Bar/Line Charts


  Background:
    Given I am an entity user
    And I visit the dashboard gallery

 
  @PMR-51 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Visualization toggle displayed in advanced modal in Grid Tiles

    When I edit a grid report tile
    And I select a saved view
    And I enter Advanced mode
    Then advanced mode contains visualization toggle with bar and line options displayed


  @PMR-51 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Line is the default visualization type for Grid Tiles

    When I begin to create a new grid based tile
    And I select a saved view
    And I save the tile
    Then I see the tile with a line chart visualization


  @PMR-51 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Line is the default toggle selection for Grid Tiles advanced modal

    When I begin to create a new grid based tile
    And I select a saved view
    And I enter Advanced mode
    Then line option is selected in advanced mode by default


  @PMR-51 @assignee:cloeper @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: Users can change tile type to Bar chart for Grid Tiles

    When I begin to create a new grid based tile
    And I select a saved view
    And I enter Advanced mode
    And I turn on the bar chart visualization
    And I save the tile
    Then I see the tile with a bar chart visualization


  @PMR-114 @assignee:cloeper @version:17.7.2 @COMPLETED
  Scenario: Clicking Delete button while in advanced edit tile modal displays prompt

    When I edit a grid report tile
    And I select a saved view
    And I enter Advanced mode
    And I delete the tile
    Then Advanced edit tile modal brings up a delete tile confirmation prompt


  @PMR-114 @assignee:cloeper @version:17.7.2 @COMPLETED
  Scenario: User must confirm deletion

    When I edit a grid report tile
    And I select a saved view
    And I enter Advanced mode
    And I delete the tile
    And I confirm delete
    Then I see the tile has been deleted

