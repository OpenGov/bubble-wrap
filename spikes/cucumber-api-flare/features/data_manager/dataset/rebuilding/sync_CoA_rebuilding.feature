Feature: Dataset rebuilding after CoA sync

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  Scenario: Syncing up single file with chart of accounts
    When Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then I see dataset 'Chart of accounts sync complete' pop-up status

  Scenario: Syncing up with chart of accounts - setting icon check
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then the settings gear should become a loading icon for 'Test' dataset
    And I should be not able to perform any action on the setting icon for 'Test'

  @release_run
  Scenario: Syncing up with chart of accounts - processing status check
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then I should see the small loading icons in front of each dataset
    And 'dataset_upl.csv' dataset should have 'Rebuilding' status
    And 'dataset_upl_new_code.csv' dataset should have 'Rebuilding' status

  Scenario: Syncing up with chart of accounts - processed status check
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I see dataset 'Chart of accounts sync complete' pop-up status
    Then 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status

  @release_run
  Scenario: Check Views after rebuild a dataset
    When Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I see dataset 'Chart of accounts sync complete' pop-up status
    And I open 'Filter & Aggregate' in Dataset menu
    And I select 'Yearly View' view
    Then I should see Preview table data

  Scenario: Syncing up with CoA - Show files: loading icon
    When Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl_new_code.csv' dataset file
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
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
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_geo_map.xlsx' dataset should have 'Added' status
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I click 'Show files' for 'dataset_upl.csv' file
    Then I should see loading icon for 'dataset_upl.csv' file in Batch
    And I should see loading icon for 'dataset_upl_new_code.csv' file in Batch
    And I should see loading icon for 'dataset_upl_geo_map.xlsx' file in Batch

  Scenario: Syncing up with CoA - Show files: status check
    When Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl_new_code.csv' dataset file
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
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
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_geo_map.xlsx' dataset should have 'Added' status
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I click 'Show files' for 'dataset_upl.csv' file
    Then I see 'Rebuilding' status for 'dataset_upl.csv' file in Batch
    And I see 'Rebuilding' status for 'dataset_upl_new_code.csv' file in Batch
    And I see 'Rebuilding' status for 'dataset_upl_geo_map.xlsx' file in Batch
    And I see 'Added' status for 'dataset_upl.csv' file in Batch
    And I see 'New Codes' status for 'dataset_upl_new_code.csv' file in Batch
    And I see 'Added' status for 'dataset_upl_geo_map.xlsx' file in Batch
    And I should not see loading icon for 'dataset_upl.csv' file in Batch
