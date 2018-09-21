@wip
Feature: Private Report Tiles


  Background:
    Given I am an entity admin
    And I visit the dashboard gallery

 
  @PMR-55 @PMR-56 @assignee:awong_at_opengov.com @assignee:hsquier @version:Dashboards_MVP @COMPLETED
  Scenario: Include Private owned reports in list

    When I edit a tile
    And I view the list of reports
    Then I see the private reports I own


  @PMR-55 @PMR-56 @assignee:awong_at_opengov.com @assignee:hsquier @version:Dashboards_MVP @COMPLETED
  Scenario: Private Reports are labeled as PRIVATE

    When I edit a tile
    And I view the list of reports
    Then I see private reports have a PRIVATE tag


  @PMR-55 @assignee:hsquier @version:Dashboards_MVP @COMPLETED
  Scenario: Create a tile with a private report

    When I create a tile with a private report
    Then I see the new tile


  @PMR-55 @assignee:hsquier @version:Dashboards_MVP @COMPLETED
  Scenario: Include Private reports shared with me

    When I edit a tile
    And I view the list of reports
    Then I see private reports that have shared with me

