@release_run
Feature: Data Manager Redshift Release Test Suite

  Background:
    Given I am logged as an 'OpenGov Admin' in 'testingvilleca' entity
    And I go to data manager from reports page

  Scenario: Upload a CoA - Redshift entity
    When I upload a 'CoA_Cerritos_v0.xls' CoA file
    And I rename CoA to: 'TEST_COA'
    And I complete CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I reload a DataManager page
    Then I should see CoA name: 'TEST_COA'

  Scenario: Delete a CoA
    When I upload a 'CoA_Cerritos_v0.xls' CoA file
    And I rename CoA to: 'TEST_COA'
    And I complete CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I reload a DataManager page
    And I delete CoA - 'TEST_COA'
    And I confirm CoA deletion
    Then I should see the following message on data_manager page:
      """
      Deleted CoA Chart of Account TEST_COA was deleted from the system.
      """
    And I shouldn't see CoA name: 'TEST_COA'

  Scenario: Create a Dataset and upload a State Scale file
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a New Codes

  Scenario: Create a Dataset and upload 32 small files in one batch
    When I upload a 'CoA_Cerritos_v0.xls' CoA file
    And I rename CoA to: 'TEST_COA'
    And I complete CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'TEST_COA' CoA
    And I upload 'dataset_upl.csv' file 32 times in Batch
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button
    Then I check 32 files 'loaded' status by api

  Scenario: Create a Dataset and upload multiple files
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And I upload 'benchmark/arizona_100K.csv' file 3 times in Batch
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Amount           | Amount                 |
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Setup & Add' Mapping button
    Then I see that dataset has '3' appended files with Added status

  Scenario: Delete a Dataset upload
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I delete dataset file 'arizona_med_dataset_1.xlsx' dataset via trash bin icon
    Then 'arizona_med_dataset_1.xlsx' dataset should have 'Deleting' status
    And I should not see 'arizona_med_dataset_1.xlsx' dataset in a source files list

  Scenario: Delete a Dataset
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I delete 'Arizona Test' Dataset
    Then I see notification contains 'Arizona Test' 'was deleted'
    And I shouldn't see 'Arizona Test' dataset in Dataset list

  Scenario: Create Copy
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    Then I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Arizona Test [Copy]' dataset
    And 'arizona_med_dataset_1.xlsx' dataset should have 'Added' status

  Scenario: Syncing up single file with chart of accounts
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I go to Configure Arizona Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then I see dataset 'Chart of accounts sync complete' pop-up status

  Scenario: Create a Grid Report
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    Then I should see report grid-table

  Scenario: Check Totals between Report and Dataset
    When I upload Outline Coa file - 'arizona_medium[outline].xlsx'
    And I rename CoA to: 'ARIZONA_TEST_COA'
    And I click 'Process'
    And I click New Dataset
    And I create linked dataset 'Arizona Test' to 'ARIZONA_TEST_COA' CoA
    And Upload 'arizona_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year          |
      | Financial Period | Fiscal period        |
      | Amount           | Amount               |
      | Appropriation    | Appropriation 1 name |
      | SubFund          | SubFund#             |
      | Account Types    | Entity name          |
      | Funds            | Fund 1 name          |
      | Departments      | Department code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes
    And I open a Dataset property panel
    And I see that 'Uncategorized' amount totals in property panel equal '$12,844,771.24'
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    Then I see grid-totals is '$12,844,771.24'
