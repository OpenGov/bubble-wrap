Feature: Smoke tests for CoA

  Scenario: Upload CoA
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    When I upload a 'CoA_Cerritos_v0.csv' CoA file
    And I rename CoA to: 'TEST_COA'
    And I start CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I click 'Process'
    Then the upload completes successfully

  Scenario: Delete CoA
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
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