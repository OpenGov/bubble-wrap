Feature: Departments tab is presented

 
  @ORPHAN @filters @ie
  Scenario Outline: Departments tab is presented for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select 'Departments' filtered by element
    Then I should see 'Departments' tab
    Examples:
      | type     | name       | desc |
      | Standard | Standard_t | std  |
      | Monthly  | Monthly_t  | mn   |


  @ORPHAN @filters
  Scenario: Departments tab is presented for Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I select 'Departments' filtered by element
    Then I should see 'Departments' tab

