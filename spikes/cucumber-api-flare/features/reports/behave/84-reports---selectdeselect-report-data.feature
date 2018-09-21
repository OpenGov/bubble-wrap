@testing_env @serial
Feature: Reports - Select/Deselect report data

 
  @ORPHAN @creation @ie
  Scenario: User can select and deselect data on reports

    Given I am logged on as an OpenGov admin
    When I am in a 'pitkincountyco' entity
    And I go to reports from visitor_analytics page
    When I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I select all the datasets
    And I search for '2015' dataset
    And I deselect all the datasets
    And I search for ' ' dataset
    Then '2015' data should be unchecked

