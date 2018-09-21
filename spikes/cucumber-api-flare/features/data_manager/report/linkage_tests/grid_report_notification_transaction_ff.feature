Feature: Grid reports should reflect when data is updating

  Scenario: Big coa - feature flag enabled
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view        |
      | item3 | optimize_queries    |
    And I go to data manager from settings_app page
    When I upload a 'arizona.xlsx' CoA file
    And I complete CoA mapping
      | funds         | Funds Group, A, Funds, B, Funds Code, C                                                   |
      | departments   | Cabinet, H, Departments, I, Departments Code, J                                           |
      | SubFund       | Fund Group, D, Fund, E, SubFund, F, SubFund Code, G                                       |
      | Appropriation | Appropriation Type, K, Appropriation Category, L, Appropriation, M, Appropriation Code, N |
      | expenses      | Expenses, O, Object Class, P, Object Group, Q, Object, R, Object Code, S                  |
      | revenues      | Revenues, T, Object Class, U, Object Group, V, Object, W, Object Code, X                  |
      | assets        | Assets, Y, Object Type, Y, Object, Y, Object Code, Y                                      |
      | liabilities   | Liabilities, Z, Object Type, Z, Object, Z, Object Code, Z                                 |
      | equities      | Equities, AA, Object Type, AA, Object, AA, Object Code, AA                                |
      | fte_counts    | FTE Counts, AB, Object Type, AB, Object, AB, Object Code, AB                              |
    And I click New Dataset
    And I create a New linked DataSet Test
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
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '...TATE OF ARIZONA' to 'Expenses' via action dropdown button
    And I save changes
    And I go to reports from data_manager page
    And I select recently created report
    Then I see 'Processing data' report pop-up

  Scenario: finish building transaction changes - feature flag enabled
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
    And I go to data manager from settings_app page
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '40001' to 'Expenses' via action dropdown button
    And I save changes
    And I create a timeout 900 seconds
    And I go to reports from data_manager page
    And I select recently created report
    Then I should see '40001' data in the table
    And I shouldn't see report pop-up

  Scenario: Big coa - feature flag disabled
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'arizona.xlsx' CoA file
    And I complete CoA mapping
      | funds         | Funds Group, A, Funds, B, Funds Code, C                                                   |
      | departments   | Cabinet, H, Departments, I, Departments Code, J                                           |
      | SubFund       | Fund Group, D, Fund, E, SubFund, F, SubFund Code, G                                       |
      | Appropriation | Appropriation Type, K, Appropriation Category, L, Appropriation, M, Appropriation Code, N |
      | expenses      | Expenses, O, Object Class, P, Object Group, Q, Object, R, Object Code, S                  |
      | revenues      | Revenues, T, Object Class, U, Object Group, V, Object, W, Object Code, X                  |
      | assets        | Assets, Y, Object Type, Y, Object, Y, Object Code, Y                                      |
      | liabilities   | Liabilities, Z, Object Type, Z, Object, Z, Object Code, Z                                 |
      | equities      | Equities, AA, Object Type, AA, Object, AA, Object Code, AA                                |
      | fte_counts    | FTE Counts, AB, Object Type, AB, Object, AB, Object Code, AB                              |
    And I click New Dataset
    And I create a New linked DataSet Test
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
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Uncategorized' tab
    And I change account type of '...TATE OF ARIZONA' to 'Expenses' via action dropdown button
    And I save changes
    And I go to reports from data_manager page
    And I select recently created report
    Then I shouldn't see report pop-up