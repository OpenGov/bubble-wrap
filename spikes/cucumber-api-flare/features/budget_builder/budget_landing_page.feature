Feature: Budget builder landing page

  @bvt @frictionless
  Scenario: An entity with budgets visit a budget by default
    Given I am logged into sausalitoca as an entity_user
    When I go to budgets from reports page
    Then I should see a default budget

  @p1 @frictionless
  Scenario: An new entity with budgets feature, COA, dataset can see budget creation panel
    Given I am logged on as an OpenGov admin
    And Create entity by api
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
    And I click New Dataset
    And I create a New linked DataSet Foo
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
    When I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to settings from data_manager page
    And I turned on Budget app
    And I wait 60 seconds
    And I go to budgets from settings_app page
    And I start to create 1st budget from landing page
    And I see budget creation panel and start to create a budget
    And I search for the budget
    Then the budget appears in the budget list

  @p1 @frictionless @wip
  Scenario: An entity using budget for the first time sees the EULA
    Given I am logged on as an OpenGov admin
    And I am in a new entity
    When I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
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
    And I go to settings from data_manager page
    And I turned on Budget app
    And I go to budgets from settings_app page
    Then I no longer see the end user license agreement
    

  @p2 @accurate @wip
  Scenario: An entity with no budgets does not have any base budget options
    Given I am logged on as an OpenGov admin
    And I am in a new entity
    When I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
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
    And I go to settings from data_manager page
    And I turned on Budget app
    And I go to budgets from settings_app page
    And I start to create budget from landing page
    Then I do not see any base budget options in the list

#    To be developed  :
#    Scenario: An new entity with budgets feature but no COA see xxx page
#
#    Scenario: An entity with budgets feature and COA but no dataset see xxx prompt
#
#    Scenario: An existing entity with all budget deleted

