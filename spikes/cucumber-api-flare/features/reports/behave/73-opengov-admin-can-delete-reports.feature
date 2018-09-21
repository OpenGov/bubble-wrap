Feature: OpenGov Admin can delete Reports

 
  @ORPHAN @deletion
  Scenario Outline: New Standard/Monthly report

    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I have created a <type> report in the "Ishim" entity
    When I visit the report
    And I should see a stacked graphs
    And I delete created report
    Then Deleted '<name>' report does not exist
    Examples:
      | type     | name          | description                |
      | Standard | New2 Standard | Based on the Standard type |
      | Monthly  | New2 Monthly  | Based on the Monthly type  |


  @ORPHAN @deletion @ie
  Scenario: New Grid-based report

    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I have created a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    When I visit the report
    Then I should see a bar graphs
    And I delete created report
    Then Deleted '<name>' report does not exist


  @ORPHAN @deletion
  Scenario Outline: New Balance Sheet report

    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I have created a Balance Sheet report in the "Ishim" entity
    When I visit the report
    And I should see a stacked graphs
    And I delete created report
    Then Deleted '<name>' report does not exist
    Examples:
      | type          | step_details                    | name               | description           | type_graph |
      | Balance Sheet | all the datasets and click next | New2 Balance Sheet | By Balance Sheet type | stacked    |

