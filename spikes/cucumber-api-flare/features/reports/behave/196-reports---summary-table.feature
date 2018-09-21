@graphs @grid_report @wip
Feature: Reports - Summary table


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page

 
  @REP-1516 @assignee:epereira @COMPLETED @REP-1516
  Scenario: The summary table should be filtered by the selected Broken Down By value

    When I select the '5 Year Capital Improvement Plan' report
    And I see default chart and legend report data
    And I select 'Project Name' from breakdown dropdown
    And I toggle 'Summary' tab from report
    Then I should see 'Project Name' in the summary table header


  @REP-1516 @assignee:epereira @COMPLETED @REP-1516
  Scenario: The columns in summary table equal to the periods in the visualization

    When I select the '5 Year Capital Improvement Plan' report
    And I see default chart and legend report data
    And I select 'Amount ($)' from show dropdown
    And I select 'Project Name' from breakdown dropdown
    And I toggle 'Summary' tab from report
    Then I should see the columns in summary table equal to the periods in the visualization


  @REP-1516 @assignee:epereira @COMPLETED @REP-1516
  Scenario: The first row and totals row should have currency symbol for monetary data

    When I select the '5 Year Capital Improvement Plan' report
    And I see default chart and legend report data
    And I select 'Amount ($)' from show dropdown
    And I select 'Project Name' from breakdown dropdown
    And I toggle 'Summary' tab from report
    Then I should see the first row first data column cell in summary table having currency symbol
    And I should see the footer row first data column cell in summary table having currency symbol

