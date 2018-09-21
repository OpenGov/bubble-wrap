@fix
Feature: Aggregates Panel


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to data manager from visitor_analytics page
    And I go to Configure 5 Year Capital Improvement Plan Dataset
    And I select Configure columns on Dataset configure option
    And I check all column names
    And I save configuration changes
    And I go to reports from data_manager page
    And I select the '5 Year Capital Improvement Plan' report

 
  @REP-1501 @assignee:pnair @COMPLETED
  Scenario: Aggregates Panel value changes according to amount column selection

    When I select 'Total Value ($)' from show dropdown
    And I open Aggregates Panel
    And I calculate with 'Total Value ($), Sort Z-A, Show Total' options
    And I get aggregate result
    And I select 'UseCode' from show dropdown
    And I open Aggregates Panel
    And I calculate with 'UseCode, Sort Z-A, Show Total' options
    Then Aggregation values should not be equal for monetary and non-monetary selections


  @REP-1501 @assignee:pnair @COMPLETED
  Scenario: Aggregates Panel value changes according to amount column and breakdown selection

    When I select 'Total Value ($)' from show dropdown
    And I select 'Parcel' from breakdown dropdown
    And I filterby 'Parcel'
    And I open Aggregates Panel
    And I calculate with 'Total Value ($), Sort Z-A, Show Total' options
    And I get aggregate result
    And I select 'UseCode' from show dropdown
    And I open Aggregates Panel
    And I calculate with 'UseCode, Sort Z-A, Show Total' options
    Then Aggregation values should not be equal for monetary and non-monetary selections


  @REP-1501 @assignee:pnair @COMPLETED
  Scenario: Aggregates Panel value changes according to amount column,breakdown selection and legends

    When I click legend first item
    And I select 'Total Value ($)' from show dropdown
    And I select 'Parcel' from breakdown dropdown
    And I filterby 'Parcel'
    And I open Aggregates Panel
    And I calculate with 'Total Value ($), Sort Z-A, Show Total' options
    And I get aggregate result
    And I select 'UseCode' from show dropdown
    And I open Aggregates Panel
    And I calculate with 'UseCode, Sort Z-A, Show Total' options
    Then Aggregation values should not be equal for monetary and non-monetary selections

