@wip
Feature: Modify gauge visualization

 
  @ORPHAN
  Scenario: Update the amount of segment on the gauge

    Given I generate a user with access to the Dashboard
    When amounts are under budget
    Then show the line for the 'remaining' area. Based on percent of total

