@view
Feature: Can reset saved view to the default view

 
  @ORPHAN @ie
  Scenario Outline: Can reset created view for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I go to Views
    And I create a 'New' view
    And I select report 'New' view
    And I click on Reset button
    Then I should see '<name_r>' report with 'Types' view
    Examples:
      | type     | name       | name_r     |
      | Standard | Standard_k | Standard_k |
      | Monthly  | Monthly_k  | Monthly_k  |


  @ORPHAN @ie
  Scenario: Can reset created view for Balance Sheet report

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I go to Views
    And I create a 'New' view
    And I select report 'New' view
    And I click on Reset button
    Then I should see 'Balance Sheet_k' report with 'Types' view

