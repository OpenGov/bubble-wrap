Feature: Show drop-down list for Standard Report

 
  @ORPHAN @filters @ie
  Scenario Outline: Show drop-down list items for Standard report

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see '<item>'
    Examples:
      | item                   |
      | Expenses               |
      | Revenues               |
      | Assets                 |
      | Liabilities & Equities |
      | Balance Sheet          |
      | Revenues vs Expenses   |


  @ORPHAN @filters
  Scenario Outline: Select Show drop-down list items change data in Standard report

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I see default report table data
    And I select '<item>' from Account Type filter
    Then I should see '<item>' data in report
    Examples:
      | item                   |
      | Expenses               |
      | Revenues               |
      | Assets                 |
      | Liabilities & Equities |
      | Revenues vs Expenses   |

