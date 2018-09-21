@view
Feature: Can go back from saved view to the default view

 
  @ORPHAN @ie
  Scenario Outline: Can go back from saved view to the default view for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I go to Views
    And I create a 'New' view
    And I select report 'New' view
    And I click back button
    Then I should see '<name_r>' report with 'Types' view
    Examples:
      | type     | name       | name_r     |
      | Standard | Standard_l | Standard_l |
      | Monthly  | Monthly_l  | Monthly_l  |


  @ORPHAN
  Scenario: Can go back from saved view to the default view for Balance Sheet report

    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I go to Views
    And I create a 'New' view
    And I select report 'New' view
    And I click back button
    Then I should see 'Balance Sheet_l' report with 'Types' view

