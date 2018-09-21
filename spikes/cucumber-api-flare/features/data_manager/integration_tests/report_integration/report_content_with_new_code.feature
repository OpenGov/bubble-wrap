Feature: Verify report content after upload dataset with new codes

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
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
    And I see dataset file status as a New Codes

  Scenario: Verify report content after upload existing code file
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I select 'Expenses' on Show
    Then I see totals is '3,916,466'

  Scenario: Verify report content (create report after re-categorized new codes)
    When I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type for group of elements to 'Expenses' via right click menu
      | item1 | 40001 |
      | item2 | 40002 |
      | item3 | 40003 |
      | item4 | 40004 |
      | item5 | 40005 |
    And I save changes
    And I create a timeout 10 seconds
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I reload a report_view page
    And I select 'Expenses' on Show
    Then I see totals is '3,916,466'

  Scenario: Verify report content (create report before re-categorized new codes)
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type for group of elements to 'Expenses' via right click menu
      | item1 | 40001 |
      | item2 | 40002 |
      | item3 | 40003 |
      | item4 | 40004 |
      | item5 | 40005 |
    And I save changes
    And I go to reports from data_manager page
    And I click once on some report
    And I reload a report_view page
    And I select 'Expenses' on Show
    Then I see totals is '3,916,466'

  Scenario: Verify the gl table loads with the code categorized as Expenses
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to data manager from settings_app page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '40001' to 'Expenses' via action dropdown button
    And I save changes
    And I create a timeout 600 seconds
    And I go to reports from data_manager page
    And I select recently created report
    And I select 'Expenses' option on Show filter
    And I expand all rows
    Then I should see currency values for 'Description pending' row
      | 0       |
      | 0       |
      | 179,144 |
      | 179,144 |

  Scenario: Verify the transactions grid loads with the code categorized as Expenses
    When I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to data manager from settings_app page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '40001' to 'Expenses' via action dropdown button
    And I save changes
    And I create a timeout 600 seconds
    And I go to reports from data_manager page
    And I select recently created report
    And I search for '40001' from search bar
    Then I should see '179,143.75' data in the table
    And I should see '40001' data in the table

  Scenario: GL report - Verify transaction table displays the updated categories for the Funds tree
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to reports from settings_app page
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report name - 'Grid Report' and description - 'description'
    And I create the report
    And I go to reports from report_view page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I click Settings button
    And I select Report Settings 'Link transactional data' option
    And I select 'Grid Report' radio button as a new Report data
    And I click 'Save' button to save report data change
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Funds' tab
    And I add new 'Fund Test Node' item to the column
    And I save changes
    And I create a timeout 600 seconds
    And I go to reports from data_manager page
    And I select recently created report
    And I select 'Expenses' option on Show filter
    And I select 'Funds' option on Broken down by filter
    And I expand all rows
    Then I should see 'Fund Test Node' table item

  Scenario: Grid Report - Verify transaction table displays the updated categories for the Funds tree
    When I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to data manager from settings_app page
    And I click edit CoA
    And I go to 'Funds' tab
    And I add new 'Fund Test Node' item to the column
    And I save changes
    And I create a timeout 600 seconds
    And I go to reports from data_manager page
    And I select recently created report
    And I select 'Fund Category' option on Broken down by filter
    Then I should see 'Fund Test Node' legend