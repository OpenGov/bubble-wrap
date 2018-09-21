@gl_report
Feature: Matching Transactions Icon


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity

 
  @REP-1124 @assignee:asimsek @version:18.4.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @ie
  Scenario: Matching Transactions Shows Solid Dot

    When I go to reports from visitor_analytics page
    And I select the 'Annual Revenues and Expenses' report
    And I toggle 'Transactions' tab from report
    And I change the transactions for date to '2016'
    And I toggle 'Summary Table' tab from report
    Then the transactions tab shows a solid dot


  @REP-1124 @assignee:asimsek @version:18.4.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED
  Scenario: No Matching Transactions Shows Zero

    When I go to reports from visitor_analytics page
    And I select the 'Annual Revenues and Expenses' report
    Then the transactions tab shows zero


  @REP-1124 @assignee:asimsek @version:18.4.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @fix
  Scenario: Loading Icon

    When I go to reports from visitor_analytics page
    And I select the 'Annual Revenues and Expenses' report
    Then the transactions tab shows a loading icon

