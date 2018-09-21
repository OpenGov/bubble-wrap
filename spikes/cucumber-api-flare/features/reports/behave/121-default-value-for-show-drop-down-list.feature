Feature: Default value for show drop-down list

 
  @ORPHAN @filters @ie
  Scenario Outline: For Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see 'Balance Sheet' as a default value for show drop-down
    Examples:
      | type     | name       | description   |
      | Standard | Standard_G | Standard type |
      | Monthly  | Monthly_G  | Monthly type  |


  @ORPHAN @filters
  Scenario Outline: For Grid report

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see '<value>' as a default value for show drop-down
    Examples:
      | type       | step_details                  | name         | desc | value             |
      | Grid-based | 'Test999' Transaction dataset | Grid-based_G | grid | InvoiceAmount ($) |


  @ORPHAN @filters
  Scenario Outline: For Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see '<value>' as a default value for show drop-down
    Examples:
      | type          | step_details                    | name            | desc | value         |
      | Balance Sheet | all the datasets and click next | Balance Sheet_G | bal  | Balance Sheet |

