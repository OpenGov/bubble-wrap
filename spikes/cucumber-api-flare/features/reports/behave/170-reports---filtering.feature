@filters
Feature: Reports - Filtering

 
  @ORPHAN @ie
  Scenario: Filtering years and switching between YoY and MoM

    Given I am logged on as an OpenGov admin
    When I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the 'Budget-to-Actual, Excluding Construction & Capital Projects' report
    And I set the fiscal year slider to '2015' - '2017'
    And I set the fiscal year slider to '2010' - '2017'
    And I click 'Monthly report options' setting
    And I select 'Month over month' option on 'Data Representation' dropdown report settings
    And I close the dialog
    And I switch for fiscal year to '2016-17'
    Then Graph should update and data should appear


  @ORPHAN
  Scenario: Can see corresponding legend items for showing by Assets filter

    When I am logged as an 'OpenGov Admin' in 'sausalitoca' entity
    And I select the 'Annual Balance Sheets' report
    Then I should see corresponded legend items for showing by Assets filter


  @ORPHAN @ie
  Scenario: Can see more legend items inside legend items

    When I am logged as an 'OpenGov Admin' in 'sausalitoca' entity
    And I select the 'Annual Balance Sheets' report
    Then I can see more legend elements inside legend elements


  @ORPHAN @ie
  Scenario: Legend changes have graph changes

    When I am logged as an 'OpenGov Admin' in 'sausalitoca' entity
    And I select the 'Annual Balance Sheets' report
    Then Legend changes have graph change

