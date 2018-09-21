@graphs @grid_report @wip
Feature: Reports - Default state


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page

 
  @REP-1515 @assignee:epereira @COMPLETED
  Scenario: The default state should be set with correct graph and show dropdown value

    When I select the '5 Year Capital Improvement Plan' report
    And I click Set default state
    And I select 'Fiscal Year' from show dropdown
    And I click on pie graph
    And I save the report default state
    And I go to reports from report_view page
    And I select the '5 Year Capital Improvement Plan' report
    Then I should see a pie graphs
    And I should see my previous filters changes of default state preserved
      | SHOW Fiscal Year |


  @REP-1515 @assignee:epereira @COMPLETED
  Scenario: The default state should be set with show dropdown value and broken down by value

    When I select the '5 Year Capital Improvement Plan' report
    And I click Set default state
    And I select 'Fiscal Year' from show dropdown
    And I select 'Project Name' from breakdown dropdown
    And I save the report default state
    And I go to reports from report_view page
    And I select the '5 Year Capital Improvement Plan' report
    Then I should see my previous filters changes of default state preserved
      | SHOW Fiscal Year            |
      | BROKEN DOWN BY Project Name |

