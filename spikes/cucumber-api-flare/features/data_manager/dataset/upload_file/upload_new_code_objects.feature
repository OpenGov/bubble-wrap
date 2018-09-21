Feature: Verify upload files with new code

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  @smoke-ci @release_run
  Scenario Outline: Upload file which contains new codes
    When Upload '<file>' dataset file
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
    Then I see dataset file status as a New Codes

    Examples:
      | file                               |
      | dataset_new_and_existing_code.xlsx |
      | dataset_all_new_code.xlsx          |

  Scenario: Upload file which contains 50 new codes (boundary conditions)
    When Upload 'dataset_50_new_code.xlsx' dataset file
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
    Then I see dataset file status as a New Codes
    And I open a Dataset property panel
    And I see '50' new codes totals in property panel

  @release_run
  Scenario: Upload file which contains 51 new codes (boundary conditions)
    When Upload 'dataset_51_new_code.xlsx' dataset file
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
    Then I see dataset 'File Append Failure!' pop-up status

  Scenario: Upload second file with new code and verify that code displayed as used
    When Upload 'dataset_50_new_code.xlsx' dataset file
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
    And I see dataset file status as a New Codes
    And I click Upload File button
    And Upload 'dataset_50_new_code.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    Then I see dataset file status as a Added
    And I see that dataset has '2' uploaded files
