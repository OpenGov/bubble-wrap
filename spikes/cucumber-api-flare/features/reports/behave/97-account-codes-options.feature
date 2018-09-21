@configuration
Feature: Account Codes options

 
  @ORPHAN @ie
  Scenario Outline: Disabled default value for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see account codes options with disabled default value
    Examples:
      | type     | name       | desc |
      | Standard | Standard_B | std  |
      | Monthly  | Monthly_B  | mn   |


  @ORPHAN
  Scenario Outline: Can make enable account codes option for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I visit the report
    And I click on account codes toggle
    Then I should see enabled account codes options
    Examples:
      | type     | name       | desc |
      | Standard | Standard_N | std  |
      | Monthly  | Monthly_N  | mn   |

