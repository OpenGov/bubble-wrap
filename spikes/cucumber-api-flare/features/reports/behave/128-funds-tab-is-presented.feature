Feature: Funds tab is presented

 
  @ORPHAN @filters
  Scenario Outline: Funds tab is presented for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select 'Funds' filtered by element
    Then I should see 'Funds' tab
    Examples:
      | type     | name       | desc |
      | Standard | Standard_r | std  |
      | Monthly  | Monthly_r  | mn   |


  @ORPHAN @filters @ie
  Scenario: Filtered by all presents for Grid-based/Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select 'Funds' filtered by element
    Then I should see 'Funds' tab

