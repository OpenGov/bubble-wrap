Feature: Filter bubble creation and deletion


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the '5 Year Capital Improvement Plan' report

 
  @REP-880 @assignee:marinha.pereira_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:State_Release_1_(W.V._+_A.Z.) @filters @version:17.9.0.0 @ie
  Scenario: Filter bubble creation

    When I open Filters panel
    And I select 'Amount ($)' from 'Add new filter'
    And I insert '25000' in 'Amount ($)' field
    Then I should see filter bubble created with '25,000.00'


  @REP-880 @assignee:marinha.pereira_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:State_Release_1_(W.V._+_A.Z.) @filters @version:17.9.0.0
  Scenario: Filter bubble deletion

    When I open Filters panel
    And I select 'Amount ($)' from 'Add new filter'
    And I insert '35000' in 'Amount ($)' field
    And I close the filter bubble with '35,000.00'
    Then I should not see the filter bubble with '35,000.00'


  @ORPHAN @filters
  Scenario: Filter bubble creation changes report data

    When I see default report table data
    And I open Filters panel
    And I select 'Amount ($)' from 'Add new filter'
    And I insert '25000' in 'Amount ($)' field
    Then I should see updated data in report


  @ORPHAN @filters @fix
  Scenario: Filter bubble deletion changes report data to default

    When I see default report table data
    And I open Filters panel
    And I select 'Amount ($)' from 'Add new filter'
    And I insert '35000' in 'Amount ($)' field
    And I should see updated data in report
    And I close the filter bubble with '35,000.00'
    Then Report table data doesn't change

