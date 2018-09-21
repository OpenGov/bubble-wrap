Feature: Control Column Visibility on Graphs


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the '5 Year Capital Improvement Plan' report

 
  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @fix
  Scenario: View amount column panel

    When I open Amounts column panel
    Then I should see 'Amount' column panel displayed


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @fix
  Scenario: View Breakdown column panel

    When I open Breakdown column panel
    Then I should see 'Breakdown' column panel displayed


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @ie @fix
  Scenario: Deselect monetary column from show menu

    When I open Amounts column panel
    And I uncheck monetary column 'Amount ($)' from Amount column panel
    Then I should not see 'Amount ($)' displayed under show menu


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @fix
  Scenario: Deselect non-monetary column from show menu

    When I uncheck non-monetary column 'Fiscal Year' from Amount column panel
    Then I should not see 'Fiscal Year' displayed under show menu


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @ie @fix
  Scenario: Deselect column from broken down by menu

    When I open Breakdown column panel
    And I uncheck column 'CIP Category' from Breakdown columns panel
    Then I should not see 'CIP Category' displayed under broken down by menu


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @fix
  Scenario: Deselect all columns from amount menu

    When I open Amounts column panel
    And I deselect all 'amount' columns
    Then I should see error message:
      """
      You must select at least one amount column
      """


  @OLY-105 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @ie @fix
  Scenario: Deselect all columns from breakdown menu

    When I open Breakdown column panel
    And I deselect all 'breakdown' columns
    Then I should see error message:
      """
      You must select at least one breakdown column
      """

