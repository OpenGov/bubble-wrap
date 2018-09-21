@configuration
Feature: OpenGov Admin can config x-axis

 
  @ORPHAN @ie
  Scenario Outline: Change x-axis labels for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I change X-axis configuration
    Then I should see new X-axis title
    Examples:
      | type     | name       | description                |
      | Standard | Standard_W | Based on the Standard type |
      | Monthly  | Monthly_W  | Based on the Monthly type  |


  @ORPHAN @ie
  Scenario Outline: Changed x-axis labels for Standard/Monthly with refresh

    Given I have a <type> report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I change X-axis configuration
    And I refresh report page
    Then I should see new X-axis title
    Examples:
      | type     | name       | description                |
      | Standard | Standard_E | Based on the Standard type |
      | Monthly  | Monthly_E  | Based on the Monthly type  |


  @ORPHAN @ie
  Scenario: Change x_axis labels for Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I change X-axis configuration
    Then I should see new X-axis title


  @ORPHAN
  Scenario: Changed x-axis labels for balance sheet report after page refresh

    Given I have a Balance Sheet report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I change X-axis configuration
    And I refresh report page
    Then I should see new X-axis title


  @ORPHAN @fix @ie
  Scenario Outline: Change report data for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I add a data point to report data
    Then I should see this data point in report
    Examples:
      | type     | name       | description                |
      | Standard | Standard_R | Based on the Standard type |
      | Monthly  | Monthly_R  | Based on the Monthly type  |


  @ORPHAN @fix
  Scenario: Change report data for Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I add a data point to report data
    Then I should see this data point in report

