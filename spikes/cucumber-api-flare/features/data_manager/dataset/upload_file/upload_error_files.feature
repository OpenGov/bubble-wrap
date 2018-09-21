Feature: Upload error files

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  Scenario: View dataset error details on property panel
    When Upload 'new_codes_bug.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Year       |
      | Amount           | Amount     |
      | Funds            | Fund       |
      | Departments      | Department |
      | Object           | Object     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency   |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File Append Failure!' pop-up status
    And 'new_codes_bug.xlsx' dataset should have 'Too Many Codes' status
    And I click on 'new_codes_bug.xlsx' source file
    Then I should see the following content
     """
     Unusual number of new codes High number of new codes may indicate that a column was mapped incorrectly. This data has not yet been added to to the dataset. View Codes Ignore and add data
     """

  Scenario: View dataset error details on property panel - Ignore and add data
    When Upload 'new_codes_bug.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Year       |
      | Amount           | Amount     |
      | Funds            | Fund       |
      | Departments      | Department |
      | Object           | Object     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency   |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File Append Failure!' pop-up status
    And 'new_codes_bug.xlsx' dataset should have 'Too Many Codes' status
    And I click on 'new_codes_bug.xlsx' source file
    And I click 'Ignore and add data' link in Property panel
    And I click 'Continue'
    Then 'new_codes_bug.xlsx' dataset should have 'Adding' status
    And I see dataset file status as a New Codes

  Scenario: View dataset error details dialog
    When Upload 'basic_error.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Year       |
      | Amount           | Amount     |
      | Funds            | Fund       |
      | Departments      | Department |
      | Object           | Object     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency   |
    And I click 'Setup & Add' Mapping button
    And 'basic_error.xlsx' dataset should have 'Error Processing' status
    And I click on 'basic_error.xlsx' source file
    And I click on View Errors button
    Then I should see error details dialog

  Scenario: Upload corrupt file
    When Upload 'corrupt.xlsx' dataset file
    Then I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
    And I click 'Setup Later' Mapping button
    Then I see dataset file status as a Parsing Error

  Scenario: Incorrect dataset mapping
    When Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fund Description        |
      | Financial Period | Department Description  |
      | Amount           | Amount                  |
      | Funds            | Fund Code               |
      | Departments      | Department Code         |
      | Object           | Object Code             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Error Processing

  @release_run
  Scenario Outline: Append file with Batch errors
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
    And I click Upload File button
    And Upload '<file>' dataset file
    And I see '<batch_status>' status for '<file>' file in Batch
    And I close error pop-up
    And I click 'Add Later' Mapping button
    Then '<file>' dataset should have '<upload_status>' status

    Examples:
      | file                     | batch_status         | upload_status         |
      | corrupt.xlsx             | Parsing Error        | Parsing Error         |
      | data_set.xlsx            | Unrecognized Columns | Unrecognized Columns  |

  Scenario: Append file with Too Many Codes error
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
    And I click Upload File button
    And Upload 'dataset_51_new_code.xlsx' dataset file
    And I see 'Ready' status for 'dataset_51_new_code.xlsx' file in Batch
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_51_new_code.xlsx' dataset should have 'Too Many Codes' status