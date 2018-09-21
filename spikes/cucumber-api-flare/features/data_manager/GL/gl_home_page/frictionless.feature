@frictionless
Feature: General Ledger Home Page (frictionless)

  @bug
  Scenario: Delete one or more data sets
    Given I am logged on as an OpenGov admin
    And I am in a 'jcwsaga' entity
    When I go to data manager from visitor_analytics page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I go to CoA page from data manager page
    And I set a Default Chart of Accounts
    And there is file from yearly data sets table to delete
    And I delete file from yearly data sets table
    Then I shouldn't see this file in yearly data sets table

  @p1 @phantom
  Scenario: Change data set information for files in the data set tabs
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    And I make changes to some file data set information
    Then I should see new data set information

  @p1 @phantom
  Scenario: New Ledger Data Set button is hiding for entity user
    Given I am logged as an entity user
    When I go to data manager from reports page
    Then I shouldn't see New Ledger Data Set button

  @bvt @phantom
  Scenario: Yearly and monthly data sets are in separate tabs
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    Then I should see yearly and monthly data sets in separate tabs

  @bvt @phantom
  Scenario: Preview a monthly or yearly data set by clicking on the file
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    And I open file from yearly data sets table
    Then I should see the data of this file

  @bvt @phantom
  Scenario: Able to select one CoA out of many
    Given I am logged on as an OpenGov admin
    When I am in a 'Gotham' entity
    And I go to data manager from visitor_analytics page
    Then I can select one CoA out of many