@table
Feature: Report Table (sorting)


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the 'Annual Balance Sheets' report
    When I open Transactions tab

 
  @ORPHAN @ie
  Scenario: Able to sort columns by ascending

    When I sort Amount column by ascending
    Then I should see Amount column sorted by ascending


  @ORPHAN
  Scenario: Able to sort columns by descending

    When I sort Amount column by descending
    Then I should see Amount column sorted by descending


  @ORPHAN @ie
  Scenario: filter the data to a specific date range

    When I set date range from '06/01/2015' to '06/05/2015'
    Then I should see data of this date range

