Feature: Dataset - Views: Filter & Aggregate [large]

  Background:
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
    And I create a New linked DataSet Arizona Test
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
    And I open a Dataset property panel
    And I click 'Got it'
    And I open 'Filter & Aggregate' in Dataset menu

  Scenario: User can filter view data
    When I select 'Yearly View' view
    And I add filter: 'Departments' should be 'not equal to' 'ARIZONA HISTORICAL SOCIETY'
    And I update view
    And the Preview table should not include 'ARIZONA HISTORICAL SOCIETY'
    Then the Preview table should be updated

  Scenario Outline: User can select default views
    When I select '<view_type>' view
    Then the Preview table should be updated
    And Data Aggregation should be unavailable for change

    Examples:
      | view_type    |
      | Yearly View  |
      | Monthly View |

  Scenario Outline: User can add new view
    When I click Add New View
    And I create Dataset View <name> with <date>, <amount>, <type>, <negate_type>
    And I save New View
    Then I should see that '<name>' is appear in View list

    Examples:
      | name              | date    | amount | type   | negate_type |
      | View_Test_Monthly | Monthly | Amount | Actual | Revenues    |
      | View_Test2_Annual | Annual  | Amount | Actual | Revenues    |

  Scenario: User can delete a view
    When I select 'Monthly View' view
    And I click on 'Delete' button
    Then I shouldn't see that '<name>' is appear in View list

  Scenario: User can modify and update default views
    When I select 'Monthly View' view
    And I modify view name into 'Monthly Test Name'
    And I update view
    Then I should see that 'Monthly Test Name' is appear in View list