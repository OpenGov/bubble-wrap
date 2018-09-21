Feature: Verify Dataset totals

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  @release_run
  Scenario: New codes totals displayed correctly on Explore
    When Upload 'dataset_all_new_code.xlsx' dataset file
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
    And I reload a Dataset page
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $4,351,880.00

  @release_run
  Scenario: New and existing code totals displayed correctly on Explore
    When Upload 'dataset_new_and_existing_code.xlsx' dataset file
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
    And I reload a Dataset page
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $10,743,917.19

  Scenario: Multiple files totals displayed correctly on Explore
    When Upload 'dataset_existing_code.xlsx' dataset file
    And Upload 'dataset_new_and_existing_code.xlsx' dataset file
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
    And 'dataset_new_and_existing_code.xlsx' dataset should have 'New Codes' status
    And 'dataset_existing_code.xlsx' dataset should have 'Added' status
    And I reload a Dataset page
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $20,743,917.19

  Scenario: New codes totals displayed correctly on Property Panel
    When Upload 'dataset_all_new_code.xlsx' dataset file
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
    And I wait 60 seconds
    And I reload a Dataset page
    And I open a Dataset property panel
    Then I see that 'Uncategorized' amount totals in property panel equal '$4,351,880.00'

  @release_run
  Scenario: New and Existing codes totals displayed correctly on Property Panel
    When Upload 'dataset_new_and_existing_code.xlsx' dataset file
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
    And I wait 60 seconds
    And I reload a Dataset page
    And I open a Dataset property panel
    Then I see that 'Expenses' amount totals in property panel equal '$3,916,465.51'
    And I see that 'Revenues' amount totals in property panel equal '$1,063,266.29'
    And I see that 'Assets' amount totals in property panel equal '$794,722.08'
    And I see that 'Liabilities' amount totals in property panel equal '$221,832.50'
    And I see that 'Equities' amount totals in property panel equal '$279,421.50'
    And I see that 'Uncategorized' amount totals in property panel equal '$4,468,209.31'

  @release_run # need move to integration suite
  Scenario: Re-categorized New codes totals displayed correctly on Report (Departments, Funds)
    When Upload 'dataset_all_new_code.xlsx' dataset file
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
    And I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '40001' to 'Expenses' via right click menu
    And I go to 'Uncategorized' tab
    And I change account type of '40002' to 'Revenues' via right click menu
    And I save changes
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    Then I see Expenses totals is '$ 179,144'
    And I see Revenues totals is '$ 500,000'

  Scenario: Rows are not added to dataset after Too Many Codes upload error
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
    And 'dataset_51_new_code.xlsx' dataset should have 'Too Many Codes' status
    And I reload a Dataset page
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $10,000,000.00

  Scenario: Explore display a correct Total Amount and number of rows
    When Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $1,900.00
    And I verify that Row Count is 19