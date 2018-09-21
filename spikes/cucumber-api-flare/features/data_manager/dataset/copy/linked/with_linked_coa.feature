Feature: Create Dataset Copy for a dataset with Linked CoA

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
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button

  Scenario: Filter & Aggregate tab check
    When I see dataset file status as a Added
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I open 'Filter & Aggregate' in Dataset menu
    Then I should see that 'Monthly View' is appear in View list
    And I should see that 'Yearly View' is appear in View list

  Scenario: Multiple files - Valid remapping
    When I click Upload File button
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I see 'Ready' status for 'dataset_upl_new_code.csv' file in Batch
    And I click 'Add to Dataset' Mapping button
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_new_code.csv' dataset should have 'Added' status

  Scenario: Multiple files - Invalid remapping
    When I click Upload File button
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I see 'Ready' status for 'dataset_upl_new_code.csv' file in Batch
    And I click 'Add to Dataset' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Fund Description | Date |
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl.csv' dataset should have 'Error Processing' status
    And 'dataset_upl_new_code.csv' dataset should have 'Error Processing' status

  Scenario: New Codes
    When I see dataset file status as a Added
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Funds            | Department Code  |
      | Departments      | Fund Code        |
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl.csv' dataset should have 'New Codes' status