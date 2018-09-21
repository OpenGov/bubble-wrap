@creation @p1 @ie_1
Feature: Entity Admin can create Reports


  Background:
    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity

 
  @ORPHAN @creation @ie
  Scenario Outline: New Standard/Monthly report

    When I begin to create a '<type>' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report name - '<name>' and description - '<description>'
    And I create the report
    Then I should see a stacked graphs
    Examples:
      | type     | name                          | description                     |
      | Standard | Standard-1                    | On the existing CoA and Dataset |
      | Monthly  | Monthly-1                     | On the existing CoA and Dataset |
      | Standard | Standard-11                   |                                 |
      | Monthly  | Monthly-11                    |                                 |
      | Standard | jJ9(){}?/<>[]\!@_#$%^&*-+=,.  | Hh7(){}?/<>_[]\!@#$%^&*-+=,.    |
      | Monthly  | Ol10(){}?/<>[]\_!@#$%^&*+=-,. | Ol11(){}?/_<>[]\!@#$%^&*-+=,.   |


  @ORPHAN @creation
  Scenario Outline: New Grid-based/Balance Sheet report

    When I begin to create a '<type>' report
    And I select <step_details>
    And I fill in the report name - '<name>' and description - '<description>'
    And I create the report
    Then I should see a <type_graph> graphs
    Examples:
      | type          | step_details                    | name                          | description                  | type_graph |
      | Grid-based    | 'Test999' Transaction dataset   | Grid-based-1                  | By existing CoA and Dataset  | bar        |
      | Balance Sheet | all the datasets and click next | Balance Sheet-1               | By existing CoA and Dataset  | stacked    |
      | Grid-based    | 'Test999' Transaction dataset   | Grid-based-11                 |                              | bar        |
      | Balance Sheet | all the datasets and click next | Balance Sheet-11              |                              | stacked    |
      | Grid-based    | 'Test999' Transaction dataset   | Kk12(){}?/<>[]\!@_#$%+^&*-=,. | Kp3(){}?/<>=[]\!@_#$%^&*-+,. | bar        |
      | Balance Sheet | all the datasets and click next | Yu09(){}?/<>,[]\!@_#$%+^&*-=. | Yc9(){}?/<>,[]\!@_#$%+&*-=^. | stacked    |

