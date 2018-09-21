@view @p1
Feature: Can create view

 
  @ORPHAN @ie
  Scenario Outline: Can create view for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I go to Views
    And I create a view
    Then I should see these view in Views list
    Examples:
      | type          | name            |
      | Standard      | Standard_h      |
      | Monthly       | Monthly_h       |
      | Balance Sheet | Balance Sheet_h |


  @ORPHAN
  Scenario: Can create view for Grid-based/Balance Sheet report

    Given I have a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I go to Views
    And I create a view
    Then I should see these view in Views list

