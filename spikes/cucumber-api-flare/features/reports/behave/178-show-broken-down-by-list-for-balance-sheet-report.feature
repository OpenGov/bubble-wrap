@filters
Feature: Show broken down by list for Balance Sheet Report


  Background:
    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @ie
  Scenario: Show Assets drop-down list items for balance Sheet report

    When I visit the report
    And I select 'Assets' from Account Type filter
    And I click on broken down by element
    Then I should see these broken-down-by elements:
      | item        |
      | Funds       |
      | Departments |
      | Asset Type  |


  @ORPHAN
  Scenario: Show Liabilities drop-down list items for balance Sheet report

    When I visit the report
    And I select 'Liabilities & Equities' from Account Type filter
    And I click on broken down by element
    Then I should see these broken-down-by elements:
      | item                    |
      | Funds                   |
      | Departments             |
      | Liability & Equity Type |


  @ORPHAN
  Scenario Outline: Select drop-down list items change data in balance Sheet report

    When I visit the report
    And I see default report table data
    And I select '<show_item>' from Account Type filter
    And I select '<filter_item>' on Broken Down By filter
    Then I should see '<filter_item>' data in report
    Examples:
      | show_item              | filter_item             |
      | Assets                 | Funds                   |
      | Assets                 | Departments             |
      | Assets                 | Asset Type              |
      | Liabilities & Equities | Funds                   |
      | Liabilities & Equities | Departments             |
      | Liabilities & Equities | Liability & Equity Type |

