Feature: Verify report content after upload dataset
  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
      | InvoiceAmount | Currency          |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added

  Scenario: Create report based on new dataset
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I choose a Specific data for report -'2009', Test
    And I fill in the report information
    And I create the report
    Then I should see a stacked graph

   Scenario: Verify report content after upload existing code file
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    Then I see totals is '10,000,000'

  Scenario: Verify group codes displayed on filter description
    When I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I save changes
    And I create a timeout 10 seconds
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I setup to display Account Codes
    And I select 'Departments' on Filtered By
    Then I see correct code descriptions for 'Public Works' group
      | item1  | Public Works |
      | item2  | Public Works |
      | item3  | Public Works |
      | item4  | Public Works |
      | item5  | Public Works |
      | item6  | Public Works |
      | item7  | Public Works |
      | item8  | Public Works |
      | item9  | Public Works |
      | item10 | Public Works |
