@wip
Feature: ReportApp Targets: Target Type Selection

  Assumptions
  * kpi targets are enabled for the entity


  Background:
    Given I am an entity user
    And I visit the dashboard gallery

 
  @PMR-104 @assignee:asimsek @version:17.6.0.0 @version:Dashboards_MVP @COMPLETED
  Scenario: Create an Above Target Type

    Given I am in a grid report
    When I create an Above target
    Then I see the Above target on the grid visualization


  @PMR-104 @assignee:asimsek @version:17.6.0.0 @version:Dashboards_MVP @COMPLETED
  Scenario: Validate the maximum and minimum fields for the range

    Given I am in a grid report
    When I begin to create a Between target
    And I set the maximum to be less than the minimum
    Then I cannot add the target
    And I see an error message


  @ORPHAN
  Scenario: Create a Between target type

    Given I am in a grid report
    When I create an Between target
    Then I see the Between target on the grid visualization


  @ORPHAN
  Scenario: Create a Below target type

    Given I am in a grid report
    When I create an Below target
    Then I see the Below target on the grid visualization


  @ORPHAN
  Scenario: A between target has two fields

    Given I am in a grid report
    When I begin to create a Between target
    Then I see a maximum field labeled To
    And I see a minumum field labeled From

