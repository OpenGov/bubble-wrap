@gl_report @graphs
Feature: Graph Refresh On Filter

 
  @REP-1120 @assignee:chad.miller_at_opengov.com @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED
  Scenario: Graph Loads Once When Multiple Filters Are Unchecked

    Given I am logged into alphatestal as an entity_admin
    And I select the 'Standard velit officia quo ut' report
    When I select 'Funds' filtered by element
    And I uncheck all but one filter
    Then The graph refreshes only once


  @REP-1120 @assignee:chad.miller_at_opengov.com @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @ie
  Scenario: Graph Loads Once When Multiple Filters Are Checked

    Given I am logged into alphatestal as an entity_admin
    And I select the 'Standard velit officia quo ut' report
    When I select 'Funds' filtered by element
    And I check all but one filter
    Then The graph refreshes only once

