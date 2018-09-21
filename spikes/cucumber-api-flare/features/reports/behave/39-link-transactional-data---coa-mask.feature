Feature: Link Transactional Data - CoA Mask

 
  @REP-1263 @assignee:aaggarwal @version:18.5.2 @COMPLETED
  Scenario: Transactions Linkage With CoA Mask - Redshift Entity

    Given I am logged into testingvilleca as an entity_admin
    And I go to data manager from reports page
    When I create a CoA mask for 'GENERAL FUND (1000)'
    And I go to reports from masking page
    And I create 'Grid-based' report with 'JC test' dataset
    And I go to reports from report_view page
    And I create 'Standard' report
    And I link the transactional data from the Grid-based report
    And I select the transaction table for date to '2007'
    And I see default transaction table data
    And I apply the CoA mask
    Then the transaction table does not show masked columns or rows


  @REP-1263 @assignee:aaggarwal @version:18.5.2 @COMPLETED @ie
  Scenario: Transactions Linkage With CoA Mask

    Given I am logged into Tobolsk as an entity_admin
    And I go to data manager from reports page
    When I create a CoA mask for 'General fund'
    And I go to reports from masking page
    And I create 'Grid-based' report with 'Test999' dataset
    And I go to reports from report_view page
    And I create 'Standard' report
    And I link the transactional data from the Grid-based report
    And I select the transaction table for date to '2007'
    And I see default transaction table data
    And I apply the CoA mask
    Then the transaction table does not show masked columns or rows

