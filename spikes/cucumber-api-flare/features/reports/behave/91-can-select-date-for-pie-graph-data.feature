Feature: Can select date for pie graph data


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @graphs
  Scenario Outline: Can select date for pie graph data for Standard/Monthly report

    When I begin to create a '<type>' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report name - '<name>' and description - 'desc'
    And I create the report
    And I click on pie graph
    And I see pie graph date - 'August'
    And I switch pie graph toggle to left
    Then I shouldn't see pie graph old date - 'August'
    Examples:
      | type     | name       |
      | Standard | Standard_j |
      | Monthly  | Monthly_j  |


  @ORPHAN @graphs @ie
  Scenario Outline: Can select date for pie graph data for Grid-based/Balance Sheet report

    When I begin to create a '<type>' report
    And I select <step_details>
    And I fill in the report name - '<name>' and description - 'desc'
    And I create the report
    And I click on pie graph
    And I see pie graph date - '<date>'
    And I switch pie graph toggle to left
    Then I shouldn't see pie graph old date - '<old_date>'
    Examples:
      | type          | step_details                    | name            | date     | old_date |
      | Grid-based    | 'Test999' Transaction dataset   | Grid-based_j    | Aug 2007 | Aug 2007 |
      | Balance Sheet | all the datasets and click next | Balance Sheet_j | 2007-08  | 2007-08  |

