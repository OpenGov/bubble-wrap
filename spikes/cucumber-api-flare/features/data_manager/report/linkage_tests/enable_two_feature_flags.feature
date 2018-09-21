Feature: Enable two feature flags: transaction_linkage and linkage_view

  Scenario: Create GL report (enable features before upload)
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view |
    And I go to data manager from settings_app page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    When I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    Then I should see a stacked graphs

  Scenario: Create GL report (enable features after upload)
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view |
    And I go to data manager from settings_app page
    And I go to Configure created Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I see dataset 'Chart of accounts sync complete' pop-up status
    And I go to reports from data_manager page
    When I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    Then I should see a stacked graphs

  Scenario: Create GL report (enable features after create report)
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    When I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I get table totals
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to reports from settings_app page
    And I select recently created report
    Then I shouldn't see table totals changes after enable feature flags

  Scenario: Configure GL report with Transaction Grid(enable features after create report)
    Given I am logged on as an OpenGov admin
    And Create entity by api
    # need to wrap to Upload COA:<CoA_name> step
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    # need to wrap to Create Report: <Report_type> step
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report name - 'Grid Report' and description - 'description'
    And I create the report
    # need to wrap to Create Report: <Report_type> step
    And I go to reports from report_view page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    # need to wrap to Enable Features: <Feature_list> step
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
    And I go to reports from settings_app page
    And I select recently created report
    And I click Settings button
    And I select Report Settings 'Link transactional data' option
    And I select 'Grid Report' radio button as a new Report data
    And I click 'Save' button to save report data change
    Then I should see 'Grid Report' Transaction Tab in GL report table

  Scenario: GL Report data should not change after Linkage_View flag
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
    And I go to data manager from settings_app page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I go to reports from report_view page
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report name - 'Grid Report' and description - 'description'
    And I create the report
    And I go to reports from report_view page
    And I select recently created report
    And I click Settings button
    And I select Report Settings 'Link transactional data' option
    And I select 'Grid Report' radio button as a new Report data
    And I click 'Save' button to save report data change
    And I get table totals
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | linkage_view |
    And I go to reports from settings_app page
    And I select recently created report
    Then I shouldn't see table totals changes after enable feature flags

  Scenario: Grid Report data should not change after notifications enable
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
    And I go to data manager from settings_app page
    # need to wrap to Upload COA:<CoA_name> step
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
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
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    # need to wrap to Create Report: <Report_type> step
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report information
    And I create the report
    And I save table data to 'report_data_1'
    And I go to settings from report_view page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | linkage_view |
    And I go to reports from settings_app page
    And I select recently created report
    And I save table data to 'report_data_2'
    Then the 'report_data_1' and 'report_data_2' reports data should be equal

  Scenario: Grid report display notification after making CoA changes
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
      | item3 | optimize_queries    |
    And I go to data manager from settings_app page
    # need to wrap to Upload COA:<CoA_name> step
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
    And I click New Dataset
    And I create a New linked Dataset with a random name
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
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I go to reports from report_view page
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report name - 'Grid Report' and description - 'description'
    And I create the report
    And I go to reports from report_view page
    And I select recently created report
    And I click Settings button
    And I select Report Settings 'Link transactional data' option
    And I select 'Grid Report' radio button as a new Report data
    And I click 'Save' button to save report data change
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '40001' to 'Expenses' via action dropdown button
    And I save changes
    And I go to reports from data_manager page
    And I select recently created report
    Then I see 'Processing data' report pop-up