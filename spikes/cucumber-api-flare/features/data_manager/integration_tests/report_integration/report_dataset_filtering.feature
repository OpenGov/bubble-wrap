Feature: Dataset - Filtering

  Scenario: Filtered dataset data displays in the report
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I open 'Filter & Aggregate' in Dataset menu
    And I select 'Monthly View' view
    And I add filter: 'Fund Code' should be 'equal to' '110'
    And I update view
    And I go to reports from data_manager page
    And I begin to create a 'Monthly' report
    And I select all ledger types
    And I select a 'Dataset Test - Monthly View' dataset views for report
    And I fill in the report information
    And I create the report
    And I click on Retry button
    And I select 'Expenses' option on Show filter
    Then I should see 'Bond Deferred Chg On Refunding' table item

  Scenario: Blank Filtered dataset existing view data displays in the report
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'profiling_flat_coa.xlsx' CoA file
    And I complete CoA mapping
      | funds        | Funds Category, A, Fund Type, B, Funds, C, Funds Code, D      |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P, Object Code, Q        |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Test Blank
    And Upload 'blank_column.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Document_Date |
      | Amount      | Test_Amount   |
      | Funds       | Level_1       |
      | Departments | Level_2       |
      | Object      | Level_3       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I open 'Filter & Aggregate' in Dataset menu
    And I select 'Yearly View' view
    And I add filter: 'Year' should be 'equal to' '2010'
    And I set 'on' value to include blanks checkbox
    And I update view
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose a Specific data for report -'2010', Test Blank - Yearly View
    And I fill in the report information
    And I create the report
    And I save table data to 'yearly_view_report'
    And I go to data manager from report_view page
    And I open Test Blank Dataset
    And I open 'Filter & Aggregate' in Dataset menu
    And I click Add New View
    And I fill in new Dataset View info: Yearly_2 with Annual, Test_Amount, Actual
    And I add filter: 'Year' should be 'equal to' '2010'
    And I save New View
    And I wait 60 seconds
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose a Specific data for report -'2010', Test Blank - Yearly_2
    And I fill in the report information
    And I create the report
    And I save table data to 'yearly_2_report'
    Then the 'yearly_view_report' and 'yearly_2_report' reports data should be equal

  @bug @DTOOLS-1088
  Scenario: Blank Filtered dataset new view data displays in the report
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'profiling_flat_coa.xlsx' CoA file
    And I complete CoA mapping
      | funds        | Funds Category, A, Fund Type, B, Funds, C, Funds Code, D      |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P, Object Code, Q        |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Test Blank
    And Upload 'blank_column.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Document_Date |
      | Amount      | Test_Amount   |
      | Funds       | Level_1       |
      | Departments | Level_2       |
      | Object      | Level_3       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose a Specific data for report -'2010', Test Blank - Yearly View
    And I fill in the report information
    And I create the report
    And I save table data to 'yearly_view_report'
    And I go to data manager from report_view page
    And I open Test Blank Dataset
    And I open 'Filter & Aggregate' in Dataset menu
    And I click Add New View
    And I fill in new Dataset View info: Blank_Empty with Annual, Test_Amount, Actual
    And I add filter: 'testblank' should be 'not equal to' '10'
    And I set 'on' value to include blanks checkbox
    And I save New View
    And I wait 60 seconds
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose a Specific data for report -'2010', Test Blank - Blank_Empty
    And I fill in the report information
    And I create the report
    And I save table data to 'blank_empty_report'
    Then the 'yearly_view_report' and 'blank_empty_report' reports data should be equal

  @bug @DTOOLS-1088
  Scenario: Blank Filtered dataset new view data displays as empty in the report
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'profiling_flat_coa.xlsx' CoA file
    And I complete CoA mapping
      | funds        | Funds Category, A, Fund Type, B, Funds, C, Funds Code, D      |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P, Object Code, Q        |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Test Blank
    And Upload 'blank_column.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Document_Date |
      | Amount      | Test_Amount   |
      | Funds       | Level_1       |
      | Departments | Level_2       |
      | Object      | Level_3       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I open 'Filter & Aggregate' in Dataset menu
    And I click Add New View
    And I fill in new Dataset View info: Blank_No_Empty with Annual, Test_Amount, Actual
    And I add filter: 'testblank' should be 'not equal to' '10'
    And I save New View
    And I select 'Blank_No_Empty' view
    And I see that mapping sheet is empty
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose a Specific data for report -'2010', Test Blank - Blank_No_Empty
    And I fill in the report information
    And I create the report
    Then the report data should be empty