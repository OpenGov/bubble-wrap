Feature: Verify Saving CoA perfomance after auto-grouping for Large Entity (QA-574)

  Scenario: As an admin user I can group codes in my CoA
    Given I am logged on as an OpenGov admin
    And I am in a new entity
    When I go to data manager from visitor_analytics page
    And I upload a 'fdny.xlsx' CoA file
    And I complete CoA mapping
      | funds       | Funds Group, A, Funds, B, Funds Code, E                                  |
      | departments | Agency Data, I, Agency Data, J, Agency Data, K, Agency Data, L, Agency Data Code, M   |
      | SubFund     | Fund Group, D, Fund, E, SubFund, F, SubFund Code, G                      |
      | expenses    | Expenses, S, Object Class, T, Object Group, U, Object, V, Object Code, W |
      | revenues    | Revenues, X, Object Type, Y, Object, Z, Object Code, AB                  |
      | assets      | Assets, AC, Object Type, AD, Object, AE, Object Code, AG                 |
      | liabilities | Liabilities, AH, Object Type, AI, Object, AJ, Object Code, AK            |
      | equities    | Equities, AM, Object Type, AN, Object, AO, Object Code, AQ               |
      | fte_counts  | FTE Counts, AR, Object Type, AS, Object, AT, Object Code, AU             |
    And I click New Dataset
    And I create a New linked DataSet FDNY Test
    And Upload 'fdny_med_dataset_1.xlsx' dataset file
    And I click 'Continue' Batch button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year      |
      | Financial Period | Fiscal Year Pay  |
      | Amount           | Amount           |
      | Financial Year   | Pay Date         |
      | SubFund          | Earned Month     |
      | Account Types    | Work Unit Code   |
      | Funds            | Earned Time(Hrs) |
      | Departments      | Fire Division    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Save' Mapping button
    And I click 'Add to Dataset' Batch button
    And I go to data manager from dataset page
    And I click edit CoA
    And I go to 'Expenses' tab
    And I add new 5 'Test_574' items with '09' codes to the Object column
    And I group duplicates on 'Object' column
    And I should see 'Auto-Grouping Successful' pop-up
    And I should see 'Test_574' group
    And I save changes
    Then I save performance metrics