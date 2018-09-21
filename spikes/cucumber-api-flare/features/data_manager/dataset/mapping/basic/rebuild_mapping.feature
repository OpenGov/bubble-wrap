Feature: Re-build Dataset mapping

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Description |
      | Object           | Object Code            |

  @release_run
  Scenario: Clear the wrong selection by clicking clear button
    When I remove mapping for the following columns
      | Departments | Department Description |
    And I map required fields for dataset file
      | Departments | Department Code |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'File processed' pop-up status
    And  I see that Test is appear in Dataset list

  Scenario: Clicking Setup Later button
    When I click 'Setup Later' Mapping button
    And I click 'Set up dataset' for 'dataset_upl.csv' file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
      | Funds            | Fund Code       |
      | Departments      | Department Code |
      | Object           | Object Code     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added
    And  I see that Test is appear in Dataset list

  Scenario: Clicking Back button
    When I click 'Back' Mapping button
    Then I see 'Continue' Mapping button

  Scenario: Clicking Cancel button
    When I click 'Cancel' Mapping button
    Then I should see confirmation dialog

  Scenario: Clicking Setup Later button
    When I click 'Setup Later' Mapping button
    Then I see dataset file status as a Ready
