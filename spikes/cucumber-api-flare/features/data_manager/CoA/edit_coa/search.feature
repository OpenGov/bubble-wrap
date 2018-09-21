Feature: Edit CoA - Search
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @p1 @phantom
  Scenario Outline: User can search in a specified tab
    When I go to '<tab>' tab
    And I search for '<query>'
    Then I should see appropriate number of search results

    Examples:
      | tab         | query    |
      | Departments | Mosquito |
      | Funds       | Library  |
      | Expenses    | Golf     |
      | Revenues    | Other    |
      | Liabilities | Funds    |
      | Assets      | Tax      |

  @p2 @release_run
  Scenario Outline: User can search for column element in a specified tab
    When I go to '<tab>' tab
    And I search for '<query>'
    Then I should see appropriate search results for '<query>'
    And I should see '<item>' column element

    Examples:
      | tab         | query      | item                           |
      | Departments | Storm      | Storm Water Projects           |
      | Funds       | Sewer Fund | Sewer Fund                     |
      | Expenses    | Land       | Landscaping & Land Improvement |
      | Revenues    | Sales      | Sales Tax Refunds              |
      | Liabilities | Wages      | Wages Payable                  |
      | Assets      | Improveme  | Due From Nw State St Improveme |
      | Equities    | 985-0320   | Encumbrances                   |