Feature: CoA Edit Integration Tests

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_new_and_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date        | Pay Date      |
      | Amount      | InvoiceAmount |
      | Funds       | FundNbr       |
      | Departments | DepartmentNbr |
      | Object      | ExpenseNbr    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency          |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I open a Dataset property panel
    And I click 'Got it'
    And I go to reports from data_manager page
    And I begin to create a 'Monthly' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I fetch report data
    And I go to data manager from report_view page
    And I click edit CoA

  Scenario: As an admin I can delete any summary level on a non ledger tree
    When I go to 'Expenses' tab
    And I delete 'Object Type' column
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated

  Scenario: As an admin I can delete any non root level on a ledger tree
    When I go to 'Assets' tab
    And I delete 'Object Type' column
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated

  Scenario: I can drag nodes into the group
    When I go to 'Expenses' tab
    And I group multiple elements via right click menu
      | item1 | Regular Earnings     |
      | item2 | Floating Holiday Pay |
      | item3 | Vacation             |
      | item4 | Jury Duty            |
      | item5 | Overtime             |
    And I expand just created group
    And I click on 'Executive Leave' column item
    And I drag 'Sick Leave' item and drop to 'Jury Duty' position
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated

  Scenario: I can drag nodes out of the group
    When I go to 'Expenses' tab
    And I group multiple elements via right click menu
      | item1 | Regular Earnings     |
      | item2 | Floating Holiday Pay |
      | item3 | Vacation             |
      | item4 | Jury Duty            |
      | item5 | Overtime             |
    And I expand just created group
    And I drag 'Jury Duty' item and drop to 'Call-Back Pay' position
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated

  Scenario: I can create a root summary level and save
    When I go to 'Funds' tab
    When I add new level for 'Funds' column
    And I save changes
    And I reload a coa_edit page
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated

  Scenario: As an admin I can move a code with the recategorize modal
    When I go to 'Revenues' tab
    And I click recategorize 'Business License' element via right click menu
    And I type in new parents for the code
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    Then I see that report data is updated
