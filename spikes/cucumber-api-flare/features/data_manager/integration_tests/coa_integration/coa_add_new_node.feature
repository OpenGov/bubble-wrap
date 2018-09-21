Feature: CoA Edit (Add new node) Integration Tests

  Scenario: New node properties used in datasets show correct totals in reports
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Equities' tab
    And I add new level for 'Object Type' column
    And I save changes
    And I go to data manager home page
    And I create a timeout 1 seconds
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_new_and_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date      |
      | Amount        | InvoiceAmount |
      | Funds         | FundNbr       |
      | Departments   | DepartmentNbr |
      | Account Types | ExpenseNbr    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency |
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
    Then I should see the Revenues Less Expenses value '48,911,0'
    And the '2' level 'Equities' value should be equal '46,0'