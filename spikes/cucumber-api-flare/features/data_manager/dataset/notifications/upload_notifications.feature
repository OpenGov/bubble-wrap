Feature: Verify notifications for dataset

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api

  Scenario: Check Batch created notification
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    Then I see dataset 'Batch created!' pop-up status

  @release_run
  Scenario: Check upload notifications
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    Then I see dataset 'File Uploaded!' pop-up status
    And I see notification contains 'dataset_upl.csv' 'successfully uploaded'

  @release_run
  Scenario: Check initialized notifications
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    Then I see dataset 'File Initialized!' pop-up status
    And I see notification contains 'dataset_upl.csv' 'initialized and is ready to be set up'

  Scenario: Check Appending Started notification
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
    Then I see dataset 'Appending started!' pop-up status

  @release_run
  Scenario: Check processed notifications
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
    Then I see dataset 'File processed' pop-up status
    And I see notification contains 'dataset_upl.csv' 'was appended'

  Scenario: Check Coa sync complete notification
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
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then I see dataset 'Chart of accounts sync complete' pop-up status

  @release_run @bug # Missing Error notification after append a wrong file
  Scenario: 'File Append Failure!' notification
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
      | Amount                 | Currency |
    And I remove mapping for the following columns
      | Department Description | Text     |
    And I map required fields for dataset file
      | Department Description | Number   |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Error Processing
    #And I see dataset 'File Append Failure!' pop-up status

  @release_run
  Scenario: Columns Do Not Match notification
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
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl_bad_headers.xlsx' dataset file
    Then I see dataset 'Columns Do Not Match' pop-up status

  @bug # Missing Error notification after append a wrong file
  Scenario: Get notifications for each upload having failed appending
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Department Description |
      | Amount           | Amount                 |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    Then 'dataset_upl.csv' dataset should have 'Error Processing' status
    # DTOOLS-1061
    And I reload a Dataset page
    And 'dataset_upl_new_code.csv' dataset should have 'Error Processing' status
#    Then I see dataset 'File Append Failure!' pop-up status
#    And I close error pop-up
#    And I see dataset 'File Append Failure!' pop-up status