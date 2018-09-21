Feature: OpenGov Admin has set default state feature

 
  @ORPHAN @configuration
  Scenario Outline: Set default state panel for Standard report displayed properly

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I click Set default state
    Then I should see '<type>' feature
    Examples:
      | type        |
      | Save Report |
      | Cancel      |


  @ORPHAN @configuration
  Scenario Outline: Settings panel for Monthly report displayed properly for linkage entity

    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I click Set default state
    Then I should see '<type>' feature
    Examples:
      | type        |
      | Save Report |
      | Cancel      |


  @ORPHAN @configuration
  Scenario Outline: Settings panel for Balance Sheet report displayed properly for linkage entity

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I click Set default state
    Then I should see '<type>' feature
    Examples:
      | type        |
      | Save Report |
      | Cancel      |


  @ORPHAN @configuration @ie
  Scenario Outline: Settings panel for Grid-based report displayed properly for linkage entity

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I click Set default state
    Then I should see '<type>' feature
    Examples:
      | type        |
      | Save Report |
      | Cancel      |

