Feature: Default value for broken down by drop-down list

 
  @ORPHAN @filters @ie
  Scenario Outline: For Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see broken down by filter disabled
    Examples:
      | type     | name       | description   |
      | Standard | Standard_H | Standard type |
      | Monthly  | Monthly_H  | Monthly type  |


  @ORPHAN @filters
  Scenario: For Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see broken down by filter disabled

