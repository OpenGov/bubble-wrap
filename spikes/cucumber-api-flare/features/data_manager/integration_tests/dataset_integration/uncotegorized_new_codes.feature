Feature: Uncategorized New Codes

  @wip
  Scenario Outline: Uncategorized new code during second upload
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'arizona.xlsx' CoA file
    And I start CoA mapping
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
    And I finish CoA mapping
    And I click New Dataset
    And I create a New linked DataSet Test1
    And Upload 'benchmark/<file>' dataset file
    And I see 'Ready' status for '<file>' file in Batch
    And I click 'Setup Later' Mapping button
    And I click New Dataset
    And I create a New linked DataSet Test2
    And Upload 'benchmark/<file>' dataset file
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
      | Amount           | Currency       |
    And I click 'Setup & Add' Mapping button
    And I select 'Test1' dataset
    And I click 'Set up dataset' for '<file>' file
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
      | Amount           | Currency       |
    And I click 'Setup & Add' Mapping button
    And '<file>' dataset should have 'New Codes' status
    And I click Upload File button
    And Upload 'benchmark/<file2>' dataset file
    And I see 'Ready' status for '<file2>' file in Batch
    And I click 'Add Later' Mapping button
    And I select 'Test2' dataset
    And I click Upload File button
    And Upload 'benchmark/<file2>' dataset file
    And I click 'Add to Dataset' Mapping button
    And I select 'Test1' dataset
    And I click 'Add to dataset' for '<file2>' file
    And I click 'Add to Dataset' Mapping button
    Then '<file2>' dataset should have 'Added' status
    And I select 'Test2' dataset
    And '<file2>' dataset should have 'Added' status

    Examples:
      | file                    | file2                     |
      | arizona_1M_new_code.csv | arizona_100K_new_code.csv |