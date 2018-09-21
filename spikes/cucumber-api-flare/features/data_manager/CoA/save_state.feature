Feature: Saving CoA states

  Scenario: User can save state for default column data input
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xls' CoA file
    And I partially complete a map for CoA columns
    And I reload a CoAImporter page
    And I re-upload a 'CoA_Cerritos_v0.xls' CoA file
    Then I should see saving data in CoA
      | Fund Category    | A |
      | Funds            | B |
      | Fund Code        | C |
      | Departments      | E |
      | Departments Code | G |

  Scenario: User can save state for new added columns
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I start CoA mapping
      | funds        | Funds Category, A, Funds, B, Fund, C, Fund Code, D         |
      | departments  | Departments, E, Departments Code, G                        |
    And I reload a CoAImporter page
    And I re-upload a 'CoA_Cerritos_v0.xlsx' CoA file
    Then I should see saving data in CoA
      | Funds Category   | A |
      | Funds            | B |
      | Fund             | C |
      | Fund Code        | D |
      | Departments      | E |
      | Departments Code | G |

  Scenario: User can continue mapping after save a state
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.csv' CoA file
    And I partially complete a map for CoA columns
    And I reload a CoAImporter page
    And I re-upload a 'CoA_Cerritos_v0.csv' CoA file
    And I continue complete a CoA map
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I click 'Process'
    Then the upload completes successfully

  Scenario: State is not saving after upload a different file
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.csv' CoA file
    And I partially complete a map for CoA columns
    And I reload a CoAImporter page
    And I re-upload a 'CoA_Cerritos_v0_[outline].xlsx' CoA file
    Then I should not see any saving data in CoA