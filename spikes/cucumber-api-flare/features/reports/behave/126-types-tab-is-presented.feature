Feature: Types tab is presented

 
  @ORPHAN @filters
  Scenario Outline: Types tab is presented for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select 'Revenue & Expense Type' filtered by element
    Then I should see 'Types' tab
    Examples:
      | type     | name       | desc |
      | Standard | Standard_y | std  |
      | Monthly  | Monthly_y  | mn   |


  @ORPHAN @filters @ie
  Scenario: Types tab is presented for Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select 'Assets, Liabilities & Equities' filtered by element
    Then I should see 'Types' tab

