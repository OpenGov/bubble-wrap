@deletion @ie @p1
Feature: Entity Admin can delete Reports

 
  @ORPHAN @deletion
  Scenario Outline: New Standard/Monthly report

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I have created a <type> report in the "Tobolsk" entity
    When I visit the report
    And I should see a stacked graphs
    And I delete created report
    Then Deleted '<name>' report does not exist
    Examples:
      | type     | name       | description                     |
      | Standard | Standard-2 | On the existing CoA and Dataset |
      | Monthly  | Monthly-2  | On the existing CoA and Dataset |


  @ORPHAN @deletion @ie
  Scenario: New Grid-based report

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I have created a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    When I visit the report
    Then I should see a bar graphs
    And I delete created report
    Then Deleted '<name>' report does not exist


  @ORPHAN @deletion @ie
  Scenario: New Balance Sheet report

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I have created a Balance Sheet report in the "Tobolsk" entity
    When I visit the report
    Then I should see a stacked graphs
    And I delete created report
    Then Deleted '<name>' report does not exist

