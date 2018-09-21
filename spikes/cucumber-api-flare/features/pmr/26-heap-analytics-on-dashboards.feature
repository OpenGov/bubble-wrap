@good
Feature: Heap Analytics on Dashboards


  Background:
    Given I am an entity admin
    And there is a publicly shared dashboard

 
  @PMR-276 @assignee:renee.kim @version:Private_Dashboards @COMPLETED
  Scenario: Visiting the dashboard gallery page loads heap analytics

    When I visit the dashboard gallery
    Then I should not see a heap analytics error in the browser console


  @PMR-276 @assignee:renee.kim @version:Private_Dashboards @COMPLETED
  Scenario: Visiting a dashboard page loads heap analytics

    When I visit the dashboard gallery
    And I visit a dashboard
    Then I should not see a heap analytics error in the browser console

