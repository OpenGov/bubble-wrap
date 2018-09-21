Feature: Upload multiple files to dataset

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  @release_run
  Scenario: Append file with new codes
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
    Then I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I click 'Add to Dataset' Mapping button
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And I click on 'dataset_upl_new_code.csv' source file
    And I click 'Got it'
    Then 'dataset_upl_new_code.csv' dataset should have 'Added' status

  @release_run
  Scenario: Append valid file
    When Upload 'dataset_1K.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Invoice_Date  |
      | Amount        | Test_Amount   |
      | Funds         | Fund          |
      | Departments   | Dept          |
      | Object        | Obj           |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount | Currency        |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'NEW ACCOUNT CODES FOUND' pop-up status
    And I click Upload File button
    And Upload 'dataset_5K.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_5K.xlsx' dataset should have 'Added' status

  Scenario: Append multiple files on one dataset
    When Upload 'dataset_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
      | Funds         | FundNbr          |
      | Departments   | DepartmentNbr    |
      | Object        | ExpenseNbr       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency          |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I append 'dataset_existing_code_short.xlsx' file 10 times with 'File processed' status
    Then I see that dataset has '11' uploaded files