Feature: Filtered by elements present for Standard and Monthly Reports

 
  @ORPHAN @filters @ie
  Scenario Outline: Filtered by elements present for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by '<filter>' element
    Examples:
      | type     | name       | desc | filter                 |
      | Standard | Standard_q | std  | Funds                  |
      | Monthly  | Monthly_q  | mn   | Funds                  |
      | Standard | Standard_w | std  | Departments            |
      | Monthly  | Monthly_w  | mn   | Departments            |
      | Standard | Standard_e | std  | Revenue & Expense Type |
      | Monthly  | Monthly_e  | mn   | Revenue & Expense Type |


  @ORPHAN @filters
  Scenario Outline: Filtering by some elements change data in Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I see default report table data
    And I select '<filter>' filtered by element
    And I uncheck '<filter_item>' item
    Then I should see updated data in report
    Examples:
      | type     | name       | desc | filter                 | filter_item  |
      | Standard | Standard_q | std  | Funds                  | General fund |
      | Monthly  | Monthly_q  | mn   | Funds                  | General fund |
      | Standard | Standard_w | std  | Departments            | Public Works |
      | Monthly  | Monthly_w  | mn   | Departments            | Public Works |
      | Standard | Standard_e | std  | Revenue & Expense Type | Assets       |
      | Monthly  | Monthly_e  | mn   | Revenue & Expense Type | Assets       |

