Feature: Can deselect all checkboxes for all types of Reports

 
  @ORPHAN @filters
  Scenario Outline: Filtered by all presents for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I see default report table data
    And I select '<select>' filtered by element
    And I uncheck all filters
    Then I should see all unchecked filters
    And I should see updated data in report
    Examples:
      | type     | name       | desc | select                 |
      | Standard | Standard_d | std  | Funds                  |
      | Monthly  | Monthly_d  | mn   | Funds                  |
      | Standard | Standard_f | std  | Departments            |
      | Monthly  | Monthly_f  | mn   | Departments            |
      | Standard | Standard_g | std  | Revenue & Expense Type |
      | Monthly  | Monthly_g  | mn   | Revenue & Expense Type |


  @ORPHAN @filters @ie
  Scenario Outline: Filtered by all presents for Grid-based/Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I see default report table data
    And I select '<types>' filtered by element
    And I uncheck all filters
    Then I should see all unchecked filters
    And I should see updated data in report
    Examples:
      | name            | types                          |
      | Balance Sheet_d | Funds                          |
      | Balance Sheet_f | Departments                    |
      | Balance Sheet_g | Assets, Liabilities & Equities |

