Feature: Filtered by all collapsible icon presents for all types of Reports

 
  @ORPHAN @filters @ie
  Scenario Outline: Filtered by all presents for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by all collapsible icon
    Examples:
      | type     | name       | desc |
      | Standard | Standard_M | std  |
      | Monthly  | Monthly_M  | mn   |


  @ORPHAN @filters
  Scenario: Filtered by all presents for Grid-based report

    Given I have a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by all collapsible icon


  @ORPHAN @filters
  Scenario: Filtered by all presents for Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    Then I should see filtered by all collapsible icon

