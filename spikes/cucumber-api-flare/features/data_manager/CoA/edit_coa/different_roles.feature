Feature: Edit CoA - different roles

  Scenario: Grouping by name new codes
    Given I am logged on as an Entity partner
    And I am in a 'TestKhilko' partner entity
    When I go to data manager from reports page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    And I go to 'Departments' tab
    And I add new 5 'Test_463' items with '09' codes to the Departments column
    And I group duplicates on 'Departments' column
    Then I should see 'Auto-Grouping Successful' pop-up
    And I should see pop-up text '11 group(s)'
    And I should see 'Test_463' group

  Scenario: Add new group to existing grouping column
    Given I am logged on as an Entity partner
    And I am in a 'TestKhilko' partner entity
    When I go to data manager from reports page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    And I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I add new 5 'Test_463' items with '09' codes to the Departments column
    And I group duplicates on 'Departments' column
    Then I should see 'Auto-Grouping Successful' pop-up
    And I should see pop-up text '1 group(s)'
    And I should see 'Test_463' group

  Scenario: Group existing group
    Given I am logged on as an Entity partner
    And I am in a 'TestKhilko' partner entity
    When I go to data manager from reports page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    And I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I should see 'Auto-Grouping Successful' pop-up
    And I group duplicates on 'Departments' column
    Then I should see 'No Duplicates Found' pop-up

  Scenario: Grouping different parents elements
    Given I am logged on as an Entity partner
    And I am in a 'TestKhilko' partner entity
    When I go to data manager from reports page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    And I go to 'Expenses' tab
    And I click on 'Personnel Expense' column item
    And I add new 1 'Test_463' items with '09' codes to the Object column
    And I click on 'Other Expenses' column item
    And I add new 1 'Test_463' items with '009' codes to the Object column
    And I group duplicates on 'Object' column
    Then I shouldn't see 'Test_463' group in 'Object' column

  @release_run
  Scenario: Entity Partner can create a CoA
    Given I am logged on as an Entity partner
    When I go to data manager from reports page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I click edit CoA
    And I go to 'Funds' tab
    Then I should see 'General Fund' column element
    And I should see 'CCPA Endowment Fund' column element
    And I should see 'Earthquake Preparedness Fund' column element