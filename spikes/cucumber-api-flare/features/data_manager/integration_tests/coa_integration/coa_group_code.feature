Feature: Verify group CoA codes Integration Test

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Departments' tab
    And I add 5 new 'Dept' items with '09' codes to the Departments column
    And I go to 'Funds' tab
    And I create a timeout 1 seconds
    And I go to 'Departments' tab
    And I group multiple elements via right click menu
      | item1 | Dept1 |
      | item2 | Dept2 |
      | item3 | Dept3 |
      | item4 | Dept4 |
      | item5 | Dept5 |
    And I save changes
    And I go to data manager from coa_edit page
    And I create a timeout 10 seconds
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_existing_code_(dtools_310).xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date        | Pay Date      |
      | Amount      | InvoiceAmount |
      | Funds       | FundNbr       |
      | Departments | DepartmentNbr |
      | Object      | ExpenseNbr    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added

  Scenario: Verify group codes highlight after upload file
    When I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Departments' tab
    And I expand just created group
    Then I see used code in 'Departments' column
      | item1 | 091 |
      | item2 | 092 |
      | item3 | 093 |
      | item4 | 094 |
      | item5 | 095 |

  Scenario: Verify group code totals on report
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I select 'Departments' on Broken Down By filter
    Then I see totals is '5,000,000'

  Scenario: Verify group codes displayed on filter description
    When I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I setup to display Account Codes
    And I select 'Departments' on Filtered By
    Then I see correct code descriptions for 'Dept1' group
      | item1 | Dept1 |
      | item2 | Dept2 |
      | item3 | Dept3 |
      | item4 | Dept4 |
      | item5 | Dept5 |
