@wip @grid_report
Feature: Queries


  Background:
    Given I am an entity admin

 
  @REP-1123 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED
  Scenario: Summary Table Does Not Send Total Query

    When I select the 'Grid multi-category' report
    And I select the summary tab
    Then the query to '/api/transactions/v2/total/' is sent '0' times


  @REP-1121 @assignee:asimsek @version:18.4.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED
  Scenario: Selecting Details Tab Sends One Details Table Query

    When I select the 'Grid multi-category' report
    And I select the details tab
    Then the query to '/api/transactions/v2/query/' is sent '1' times


  @REP-1372 @assignee:chad.miller_at_opengov.com @version:18.4.2 @COMPLETED
  Scenario: Filtering Report Only Sends One Visualization Query

    When I create a grid report using the 'Cerritos Unlinked' dataset
    And I select the 'bar' graph icon
    And I select a 'bar' graph segment
    Then the query to '/api/transactions/v2/query/' is sent '4' times

