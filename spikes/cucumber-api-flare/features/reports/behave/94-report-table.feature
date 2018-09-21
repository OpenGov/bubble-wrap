@table
Feature: Report Table


  Background:
    Given I am logged on as an OpenGov admin

 
  @ORPHAN @ie
  Scenario: Displays blue dot instead of total number of rows

    When I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the 'Annual Balance Sheets' report
    Then I should not see total number of rows


  @ORPHAN
  Scenario: Able to hide columns

    When I am in a 'Gotham' entity
    And I go to reports from visitor_analytics page
    And I select the 'Private Annual' report
    And I hide some columns
    Then I shouldn't see this columns in a table


  @ORPHAN @ie
  Scenario: Able to unhide columns by using columns filter

    When I am in a 'Gotham' entity
    And I go to reports from visitor_analytics page
    And I select the 'Private Annual' report
    And I hide some columns
    And I unhide some columns
    Then I should see this columns in a table


  @ORPHAN @ie @fix
  Scenario: Transactions are a scrollable list

    When I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the 'Annual Balance Sheets' report
    And I open Transactions tab
    Then I should see transactions as a scrollable list


  @ORPHAN
  Scenario: User can search for transactions

    When I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the 'Annual Balance Sheets' report
    And I open Transactions tab
    And I search 'AP Invoice Batch' data
    Then I should see 'AP Invoice Batch' data in the table

