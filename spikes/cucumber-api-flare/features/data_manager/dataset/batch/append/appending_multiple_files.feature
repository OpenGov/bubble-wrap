Feature: Batch Upload - Append multiple files

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api

  Scenario: Append multiple files when one has an error
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl.xlsx' dataset file
    And Upload 'dataset_upl.xls' dataset file
    And Upload 'dataset_upl_bad_headers.xlsx' dataset file
    And I see 'Unrecognized Columns' status for 'dataset_upl_bad_headers.xlsx' file in Batch
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_upl_bad_headers.xlsx' dataset should have 'Unrecognized Columns' status

  Scenario: Append to Dataset when one of many Ready uploads has unrecognized columns
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl.xlsx' dataset file
    And Upload 'dataset_upl.xls' dataset file
    And Upload 'basic_error.xlsx' dataset file
    And I see 'Unrecognized Columns' status for 'basic_error.xlsx' file in Batch
    And I click 'Add to Dataset' Mapping button
    Then 'basic_error.xlsx' dataset should have 'Unrecognized Columns' status

  Scenario: Append to Dataset with one that has too Many codes
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
      | Funds         | FundNbr          |
      | Departments   | DepartmentNbr    |
      | Object        | ExpenseNbr       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_existing_code.xlsx' dataset file
    And Upload 'dataset_existing_code.xlsx' dataset file
    And Upload 'dataset_existing_code.xlsx' dataset file
    And Upload 'dataset_51_new_code.xlsx' dataset file
    And I see 'Ready' status for 'dataset_51_new_code.xlsx' file in Batch
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_51_new_code.xlsx' dataset should have 'Too Many Codes' status
