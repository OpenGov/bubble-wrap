Feature: Filtered by elements present for Grid-based and Balance Sheet Reports

 
  @ORPHAN @filters @ie
  Scenario Outline: Filtered by elements present for Grid-based report

    Given I have a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by '<filter>' element
    Examples:
      | type       | step_details                  | name         | desc | filter     |
      | Grid-based | 'Test999' Transaction dataset | Grid-based_q | gr   | Filters    |
      | Grid-based | 'Test999' Transaction dataset | Grid-based_w | gr   | Columns    |
      | Grid-based | 'Test999' Transaction dataset | Grid-based_e | gr   | Aggregates |


  @ORPHAN @filters
  Scenario Outline: Filtered by elements present for Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by '<filter>' element
    Examples:
      | type          | step_details                    | name            | desc | filter                         |
      | Balance Sheet | all the datasets and click next | Balance Sheet_q | bl   | Funds                          |
      | Balance Sheet | all the datasets and click next | Balance Sheet_w | bl   | Departments                    |
      | Balance Sheet | all the datasets and click next | Balance Sheet_e | bl   | Assets, Liabilities & Equities |

