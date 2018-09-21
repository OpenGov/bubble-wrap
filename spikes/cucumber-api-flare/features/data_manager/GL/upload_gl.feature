Feature: Upload a General Ledger

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api

  @bvt
  Scenario: Upload a GL
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I upload a GL
    Then the GL process completes successfully

  @bvt
  Scenario: Upload a Dataset (using a GL)
    When I upload a General Ledger as a dataset
    Then the GL upload completes successfully

  @p1
  Scenario: Dataset Column Mapping (using a GL)
    When I upload a General Ledger as a dataset
    And I map the General Ledger columns
    Then the GL column mapping completes successfully
