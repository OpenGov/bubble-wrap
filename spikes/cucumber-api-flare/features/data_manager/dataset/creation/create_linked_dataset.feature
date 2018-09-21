Feature: Create Linked Dataset

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I rename CoA to: 'CoA_Cerritos_v0.xlsx'
    And I complete a map for CoA columns

  Scenario: Create a CoA linked Dataset
    When I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    Then I see that Test is appear in Dataset list

  Scenario: Create Linked to non-default CoA Dataset
    When I go to CoA page from data manager page
    And I upload a 'profiling_flat_coa.xlsx' CoA file
    And I rename CoA to: 'profiling_flat_coa.xlsx'
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
    And I generate a Dataset linked to 'profiling_flat_coa.xlsx' CoA
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    Then I should see newly created dataset in Dataset list