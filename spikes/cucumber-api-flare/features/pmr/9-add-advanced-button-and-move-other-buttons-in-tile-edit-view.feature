@good
Feature: Add Advanced button and move other buttons in tile edit view


  Background:
    Given I am an entity admin

 
  @PMR-115 @assignee:renee.kim @version:17.7.2 @COMPLETED
  Scenario: User views YoY Tile in viewport less than the minimum

    Given there is a dashboard with a YoY tile
    And the window is less than 790px
    When I visit the dashboard gallery
    And I edit the tile
    Then I still have the ability to delete and save tiles


  @PMR-115 @assignee:renee.kim @version:17.7.2 @COMPLETED
  Scenario: User views tile editor of non-YoY or grid report tile

    Given there is a dashboard with a non-advanced tile
    And the window is greater than or equal to 790px
    When I visit the dashboard gallery
    And I edit the tile
    Then I do not see the Advanced mode capability
    And I still have the ability to delete and save tiles


  @ORPHAN
  Scenario: User views YoY Tile in viewport greater than the minimum

    Given there is a dashboard with a YoY tile
    And the window is greater than or equal to 790px
    When I visit the dashboard gallery
    And I edit the tile
    Then I see all functions at the bottom of the tile


  @ORPHAN
  Scenario: User edits a grid report tile greater than the minimum

    Given there is a dashboard with a grid report tile
    And the window is greater than or equal to 790px
    When I visit the dashboard gallery
    And I edit the tile
    Then I see all capabilities at the bottom of the tile


  @ORPHAN
  Scenario: User views grid report tile in viewport less than the minimum

    Given there is a dashboard with a grid report tile
    And the window is less than 790px
    When I visit the dashboard gallery
    And I edit the tile
    Then I do not see the Advanced mode capability
    And I still have the ability to delete and save tiles

