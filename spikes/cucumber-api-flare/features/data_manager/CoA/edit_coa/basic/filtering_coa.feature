Feature: Edit CoA - Filtering
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @p1 @release_run
  Scenario Outline: User can filter data in column
    When I go to '<tab>' tab
    And I filter data with '<pattern>' in '<name>' column
    Then I should see appropriate '<number>' of items in '<name>' column

    Examples:
      | tab         | pattern | name          | number |
      | Departments | S       | Function      | 10     |
      | Funds       | Trust   | Fund Type     | 1      |
      | Expenses    | All     | Object Type   | 5      |
      | Liabilities | Eic     | Object Type   | 1      |
      | Equities    | 0345    | Object        | 11     |