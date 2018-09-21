Feature: Show drop-down list for Balance Sheet Report

 
  @ORPHAN @filters @ie
  Scenario Outline: Show drop-down list items for balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see '<item>'
    Examples:
      | item                   |
      | Assets                 |
      | Liabilities & Equities |
      | Balance Sheet          |


  @ORPHAN @filters
  Scenario Outline: Select Show drop-down list items change data in balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I see default report table data
    And I select '<item>' from Account Type filter
    Then I should see '<item>' data in report
    Examples:
      | item                   |
      | Assets                 |
      | Liabilities & Equities |

