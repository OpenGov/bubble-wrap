@wip
Feature: Prevent Drill In


  Background:
    Given I am an entity user
    And I visit the dashboard gallery

 
  @PMR-57 @assignee:renee.kim @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: User does not have report access to a tile

    When I am viewing a tile with a report I cannot access
    Then I see a lock icon


  @PMR-57 @assignee:renee.kim @version:17.7.2 @version:Dashboards_MVP @COMPLETED
  Scenario: User has report access to a tile

    When I am viewing a tile with a report I can access
    Then I do not see a lock icon
    And I can drill deeper into the report


  @ORPHAN
  Scenario: Error message for tiles with unaccessible reports

    When I am giving a tile with a report I cannot access
    And I try to drill into the report
    Then I am unable to drill into the report
    And I see a message that I cannot access the report

