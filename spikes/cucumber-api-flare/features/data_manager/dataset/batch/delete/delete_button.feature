Feature: Batch Upload - Delete datasource

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  Scenario: Remove datasource with no uploads
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    And I click Upload File button
    Then 'Cancel' button is disable

  Scenario: Remove datasource with parsed uploads but do not confirm the deletion
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I delete 'dataset_upl.csv' file from Batch upload
    And I click on Confirmation dialog - 'Cancel'
    And I should see 'dataset_upl.csv' file in Batch upload table
    And I reload a DatasetMapping page
    And I wait 12 seconds
    Then I should see 'dataset_upl.csv' file in Batch upload table

  Scenario: Remove datasource while files are uploading
    When Upload 'dataset_200K.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    Then 'Cancel' button is disable

  Scenario: Remove datasource after files have uploaded but not parsed
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Parsing' status for 'dataset_upl.csv' file in Batch
    Then 'Cancel' button is disable

  Scenario: Remove datasource while append job is running
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
    And I map optional fields for dataset file
      | Funds            | Fund Description        |
      | Departments      | Department Description  |
      | Object           | Object Description      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And I click 'Show files' for 'dataset_upl.csv' file
    Then 'Cancel' button is disable