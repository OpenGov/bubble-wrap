@filters
Feature: Broken down by drop-down list for Monthly Report

 
  @ORPHAN @ie
  Scenario: Show Expenses drop-down list items for Monthly report

    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I select 'Expenses' from Account Type filter
    And I click on broken down by element
    Then I should see these broken-down-by elements:
      | item         |
      | Funds        |
      | Departments  |
      | Expense Type |


  @ORPHAN
  Scenario: Show Revenues drop-down list items for Monthly report

    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I select 'Revenues' from Account Type filter
    And I click on broken down by element
    Then I should see these broken-down-by elements:
      | item         |
      | Funds        |
      | Departments  |
      | Revenue Type |


  @ORPHAN @ie
  Scenario Outline: Select drop-down list items change data in Monthly report

    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I see default report table data
    And I select '<show_item>' from Account Type filter
    And I select '<filter_item>' on Broken Down By filter
    Then I should see '<filter_item>' data in report
    Examples:
      | show_item | filter_item  |
      | Expenses  | Funds        |
      | Expenses  | Departments  |
      | Expenses  | Expense Type |
      | Revenues  | Funds        |
      | Revenues  | Departments  |
      | Revenues  | Revenue Type |

