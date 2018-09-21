Feature: OpenGov Admin can change name and description of created reports

 
  @ORPHAN @configuration @fix
  Scenario Outline: Can change Standard/Monthly report description visibility

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I enable report description visibility
    And I disable report description visibility
    Examples:
      | type     | first_name | description   |
      | Standard | Standard_U | Standard type |
      | Monthly  | Monthly_U  | Monthly type  |


  @ORPHAN @configuration @ie
  Scenario Outline: Can change Grid-based/Balance Sheet report description visibility

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I enable report description visibility
    And I disable report description visibility
    Examples:
      | type          | step_details                    | first_name           | description   |
      | Balance Sheet | all the datasets and click next | New1 Balance Sheet_U | Balance Sheet |


  @ORPHAN @configuration @fix
  Scenario Outline: Can change Standard/Monthly report name

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I change created report name to '<second_name>'
    Then I should see new report name - '<second_name>'
    Examples:
      | type     | first_name | description   | second_name |
      | Standard | Standard_Y | Standard type | Standard_Y  |
      | Monthly  | Monthly_Y  | Monthly type  | Monthly_Y   |


  @ORPHAN @configuration @fix
  Scenario: Can change Grid-based report name

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I change created report name to 'delta'
    Then I should see new report name - 'delta'


  @ORPHAN @configuration @ie @fix
  Scenario: Can change Balance Sheet report name

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I change created report name to 'delta'
    Then I should see new report name - 'delta'

