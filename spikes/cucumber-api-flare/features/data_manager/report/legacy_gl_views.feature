@wip # redshift entity
Feature: Legacy GL Views

  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'testingvilleca' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to 'Arizona_CoA (Medium)' CoA
    And Upload 'arizona_small_dataset_1.xlsx' dataset file
    And I click 'Continue' Batch button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Financial Period | Fiscal period          |
      | Amount           | Amount                 |
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Save' Mapping button
    And I click 'Add to Dataset' Batch button
    And I see dataset 'File processed' pop-up status

  Scenario: Default Views present
    When I open 'Filter & Aggregate' in Dataset menu
    Then I should see default views:
      | Monthly View |
      | Yearly View  |

  Scenario: Totals in Standart report are correct
    When I open a Dataset property panel
    And I see that 'Expenses' amount totals in property panel equal '$2,553,493.36'
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select 'Arizona_CoA (Medium)' CoA
    And I select all ledger types
    And I select created dataset Yearly view
    And I fill in the report information
    And I create the report
    Then I see Expenses totals is '$ 2,553,493'

  Scenario: Totals in Monthly report are correct
    When I open a Dataset property panel
    And I see that 'Expenses' amount totals in property panel equal '$2,553,493.36'
    And I go to reports from data_manager page
    And I begin to create a 'Monthly' report
    And I select 'Arizona_CoA (Medium)' CoA
    And I select all ledger types
    And I select created dataset Monthly view
    And I fill in the report information
    And I create the report
    Then I see Expenses totals is '$ 2,553,493'

  Scenario: Totals in Grid-based report are correct
    When I open a Dataset property panel
    And I see that 'Expenses' amount totals in property panel equal '$2,553,493.36'
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    Then I see grid-totals is '$2,553,493.36'

  Scenario: Syncing up with chart of accounts
    When I go to Configure created Dataset
    And I select Sync with chart of accounts on Dataset configure option
    Then I see dataset 'Chart of accounts sync complete' pop-up status

  Scenario: Ledger negation, view totals are correct
    When I open 'Filter & Aggregate' in Dataset menu
    And I click Add New View
    And I create Dataset View Test Yearly View with Annual, Amount, Actual, ''
    And I save New View
    And I should see that 'Test Yearly View' is appear in View list
    And I open 'Source files' in Dataset menu
    And I open a Dataset property panel
    And I see that 'Expenses' amount totals in property panel equal '$2,553,493.36'
    And I go to reports from data_manager page
    And I begin to create a 'Standard' report
    And I select 'Arizona_CoA (Medium)' CoA
    And I select all ledger types
    And I select created dataset Test Yearly view
    And I fill in the report information
    And I create the report
    And I see Expenses totals is '$ 2,553,493'
    And I go to data manager from report_view page
    And I go to newly created Dataset
    And I open 'Filter & Aggregate' in Dataset menu
    And I select 'Test Yearly View' view
    And I add all Negate Types
    And I update view
    And I go to reports from data_manager page
    And I open newly created report for 'Arizona_CoA (Medium)' CoA
    Then I see Expenses totals is '$ -2,553,493'
