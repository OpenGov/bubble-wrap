Feature: Select default views multiple uploads

  Background:
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
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl.xlsx' dataset file
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
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
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl.xlsx' dataset should have 'Added' status
    And 'dataset_upl_geo_map.xlsx' dataset should have 'Added' status
    And I open 'Filter & Aggregate' in Dataset menu

  Scenario Outline: Select a default view for dataset with multiple uploads
    When I select '<view_type>' view
    Then the Preview table should be updated
    And Data Aggregation should be unavailable for change

    Examples:
      | view_type    |
      | Yearly View  |
      | Monthly View |

  Scenario Outline: Create a view for dataset with multiple uploads
    When I click Add New View
    And I create Dataset View <name> with <date>, <amount>, <type>, <negate_type>
    And I save New View
    Then I should see that '<name>' is appear in View list

    Examples:
      | name              | date    | amount | type   | negate_type |
      | View_Test_Monthly | Monthly | Amount | Actual | Revenues    |
      | View_Test2_Annual | Annual  | Amount | Actual | Revenues    |
