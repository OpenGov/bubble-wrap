@ie @fix
Feature: Link Transactional Data - Column Filter


  Background:
    Given I am logged into alphatestal as an entity_admin
    And I create 'Grid-based' report with 'Cerritos Linked' dataset
    And I filter out some columns as default state
     | Department Category |
     | Fund Type           |
    And I go to reports from report_view page

 
  @REP-1197 @assignee:asimsek @version:18.3.2 @COMPLETED @ie
  Scenario: Linked Monthly GL Report

    When I create 'Monthly' report
    And I link the transactional data from the Grid-based report
    And I select the Grid-based transaction table
    Then filtered columns from the linked report are not shown


  @REP-1197 @assignee:asimsek @version:18.3.2 @COMPLETED
  Scenario: Linked Standard GL Report

    When I create 'Standard' report
    And I link the transactional data from the Grid-based report
    And I select the Grid-based transaction table
    Then filtered columns from the linked report are not shown

