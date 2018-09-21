@grid_report @table
Feature: Table Data Records

 
  @REP-1123 @REP-1310 @assignee:chad.miller_at_opengov.com @version:Scale_and_Performance_for_Current_Financial_Reporting @WIP
  Scenario: Row Count - Greater Than A Thousand Records

    Given I am logged into Tobolsk as an entity_admin
    When I select the '1K+5 Rows Report' report
    Then the grid report row count showing value is 1000


  @REP-1123 @REP-1310 @assignee:chad.miller_at_opengov.com @version:Scale_and_Performance_for_Current_Financial_Reporting @WIP
  Scenario: Row Count - Less Than A Thousand Records

    Given I am logged into Tobolsk as an entity_admin
    When I select the '1K-1 Rows Report' report
    Then the grid report row count showing value equals the total number of records

