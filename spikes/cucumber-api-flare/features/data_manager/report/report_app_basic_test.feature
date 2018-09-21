Feature: Verify report app

  Background:
    Given I am logged on as an OpenGov admin
    And Create an Entity and Entity User by api
    When I open entity settings from visitor analytics page
    And I enable the following feature flags
      | item1 | notifications             |
      | item2 | saved_views               |
      | item3 | create_dataset            |
      | item4 | unlimited_report_creation |
      | item5 | transaction_linkage       |
      | item6 | coa_masking               |
    And I go to data manager from settings_app page
    And I upload a 'arizona.xlsx' CoA file
    And I complete CoA mapping
      | funds        | Funds Group, A, Funds, B, Funds Code, C                                                   |
      | departments  | Cabinet, H, Departments, I, Departments Code, J                                           |
      | SubFund      | Fund Group, D, Fund, E, SubFund, F, SubFund Code, G                                       |
      | Appropriation| Appropriation Type, K, Appropriation Category, L, Appropriation, M, Appropriation Code, N |
      | expenses     | Expenses, O, Object Class, P, Object Group, Q, Object, R, Object Code, S                  |
      | revenues     | Revenues, T, Object Class, U, Object Group, V, Object, W, Object Code, X                  |
      | assets       | Assets, Y, Object Type, Y, Object, Y, Object Code, Y                                      |
      | liabilities  | Liabilities, Z, Object Type, Z, Object, Z, Object Code, Z                                 |
      | equities     | Equities, AA, Object Type, AA, Object, AA, Object Code, AA                                |
      | fte_counts   | FTE Counts, AB, Object Type, AB, Object, AB, Object Code, AB                              |
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'arizona_test_year_13-15.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year             |
      | Financial Period | Fiscal period           |
      | Amount           | Amount                  |
      | Appropriation    | Appropriation 1 name    |
      | Funds            | Fund 1 code             |
      | Departments      | Department code         |
      | SubFund          | Subfund No              |
      | Object           | Object No               |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Monthly' report
    And I select all ledger types
    And I select a 'Monthly' dataset views for report
    And I fill in the report information
    And I create the report

  Scenario: Create monthly report
    Then I should see a gl report table during 15 sec

  Scenario: Change basic monthly report settings
    Then I should see report update after change filter data
      | item 1 | Fiscal year through, September |
      | item 2 | Fiscal year through, July      |
      | item 3 | Fiscal year through, March     |
      | item 4 | Show, Revenues                 |
      | item 5 | Show, Revenues vs Expenses     |

  Scenario: Changing the broken down by does not change the totals
    When I select 'Expenses' option on Show filter
    And I select 'Funds' option on Broken down by filter
    Then I shouldn't see report totals update after change filter data
      | item 1 | Broken down by, Funds         |
      | item 2 | Broken down by, Departments   |
      | item 3 | Broken down by, Appropriation |
      | item 4 | Broken down by, SubFund       |
      | item 5 | Broken down by, Expense Type  |
    When I select 'Revenues' option on Show filter
    And I select 'Funds' option on Broken down by filter
    Then I shouldn't see report totals update after change filter data
      | item 1 | Broken down by, Funds         |
      | item 2 | Broken down by, Departments   |
      | item 3 | Broken down by, Appropriation |
      | item 4 | Broken down by, SubFund       |
      | item 5 | Broken down by, Revenue Type  |
    When I select 'Revenues vs Expenses' option on Show filter
    Then I should see 'Revenues Less Expenses' report table element

  Scenario: Change the fiscal year in the month over month setting
    When I click Settings button
    And I select Report Settings 'Monthly report options' option
    And I select 'Month over month' option on 'Data Representation' dropdown report settings
    And I close a report settings window
    Then I should see a 'For Fiscal Year'filter

  Scenario:  I can change the report default state
    When I click Settings button
    And I select Report Settings 'Monthly report options' option
    And I select 'Month over month' option on 'Data Representation' dropdown report settings
    And I select 'Incremental' option on 'Amounts' dropdown report settings
    And I close a report settings window
    And I click Set default state
    And I save the report default state
    And I go to reports from report_view page
    And I click once on some report
    Then I should see 'incremental amounts' report amount type

  Scenario: Share report with my organization
    When I edit access link
    And I select 'My organization' type
    And I logged out from report_view page
    And I am logged as an my organization user
    Then I should see created report on Reports list
    When I select recently created report
    Then I see that report is created successfully

  Scenario: Invite Entity user to the report
    When I click on Share tab
    Then I should see 'Private' report access status
    When I logged out from report_view page
    And I am logged as an my organization user
    Then I should not see any reports
    When I logged out from reports page
    And I am logged on as an OpenGov admin
    And I'm in newly created entity
    And I go to reports from visitor_analytics page
    And I click once on some report
    And I invite Entity user to report
    And I logged out from report_view page
    And I am logged as an my organization user
    Then I should see created report on Reports list
    When I select recently created report
    Then I see that report is created successfully

