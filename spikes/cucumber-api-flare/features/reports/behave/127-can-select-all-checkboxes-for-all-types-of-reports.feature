Feature: Can select all checkboxes for all types of Reports

 
  @ORPHAN @filters
  Scenario Outline: Filtered by all presents for Standard/Monthly report

    Given I have a <type> report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I click on all collapsable icon
    Then I should see all checked filters
    Examples:
      | type     | name       | desc |
      | Standard | Standard_s | std  |
      | Monthly  | Monthly_s  | mn   |


  @ORPHAN @filters @ie
  Scenario: Filtered by all presents for Balance Sheet report

    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I click on all collapsable icon
    Then I should see all checked filters


  @ORPHAN @filters
  Scenario: Filtered by all presents for Grid report

    Given I have a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I click on all collapsable icon
    Then I should see all checked filters

