Feature: Dataset - file deletion via property panel

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api

  Scenario: Delete Dataset from Property panel
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list

  Scenario: Delete Linked Dataset from Property panel
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
      | Funds            | Fund Code               |
      | Departments      | Department Code         |
      | Object           | Object Code             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list

  Scenario: Delete file from multiple uploads from Property panel
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
      | Funds            | Fund Code               |
      | Departments      | Department Code         |
      | Object           | Object Code             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list

  Scenario: Watch file be deleted from batch with refresh
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    And I click 'Show files' for 'dataset_upl.csv' file
    Then I see 'Deleting' status for 'dataset_upl.csv' file in Batch
    And I should see no uploads