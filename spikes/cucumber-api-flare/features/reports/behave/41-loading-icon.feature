@gl_report
Feature: Loading Icon

 
  @REP-1119 @assignee:kkhilko @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @fix @ie
  Scenario: Verify Loading Icon For Show Filter

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Annual Revenues and Expenses' report
    And I select 'Expenses' from Account Type filter 
    And I select 'Funds' on Broken Down By filter
    Then I should see Loading Icon


  @REP-1119 @assignee:kkhilko @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @ie @fix
  Scenario: Verify Loading Icon For Broken Down Filter

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Annual Revenues and Expenses' report
    And I select 'Expenses' from Account Type filter
    And I select 'Funds' on Broken Down By filter
    Then I should see Loading Icon


  @REP-1119 @assignee:kkhilko @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @fix
  Scenario: Verify Loading Icon For Filtered By Filter

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Annual Revenues and Expenses' report
    And I select 'Funds' filtered by element
    And I uncheck 'General Fund' item
    Then I should see Loading Icon


  @REP-1119 @assignee:kkhilko @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @fix @ie
  Scenario: Verify Loading Icon For Drilldown

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Annual Revenues and Expenses' report
    And I click to any graph chart drill-downs
    Then I should see Loading Icon


  @REP-1119 @assignee:kkhilko @version:18.3.2 @version:Scale_and_Performance_for_Current_Financial_Reporting @COMPLETED @fix
  Scenario: Verify Loading Icon For Saved Views

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Annual Balance Sheets' report
    And I go to Views
    And I select view - 'Statement of Cash & Investments - All Funds'
    Then I should see Loading Icon

