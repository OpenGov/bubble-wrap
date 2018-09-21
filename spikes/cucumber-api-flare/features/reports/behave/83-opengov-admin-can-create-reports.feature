Feature: OpenGov Admin can create Reports


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @creation
  Scenario Outline: New Standard/Monthly report

    When I begin to create a '<type>' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report name - '<name>' and description - '<description>'
    And I create the report
    Then I should see a stacked graphs
    Examples:
      | type     | name                          | description                   |
      | Standard | New1 Standard                 | Based on the Standard type    |
      | Monthly  | New1 Monthly                  | Based on the Monthly type     |
      | Standard | New11 Standard                |                               |
      | Monthly  | New11 Monthly                 |                               |
      | Standard | Xz09(){}?!/<>[]\@_#$%^&,*-+=. | Br5(){}?/<>_[]\!@#$%^&*-+=,.  |
      | Monthly  | yT17(){}?/<>[]\_!@#$%^&*+=-,. | iO12(){}?/_<>[]\!@#$%^&*-+=,. |


  @ORPHAN @creation @ie
  Scenario Outline: New Grid-based/Balance Sheet report

    When I begin to create a '<type>' report
    And I select <step_details>
    And I fill in the report name - '<name>' and description - '<description>'
    And I create the report
    Then I should see a <type_graph> graphs
    Examples:
      | type          | step_details                    | name                          | description                  | type_graph |
      | Grid-based    | 'Test999' Transaction dataset   | New1 Grid-based               | By Grid-based type           | bar        |
      | Balance Sheet | all the datasets and click next | New1 Balance Sheet            | By Balance Sheet type        | stacked    |
      | Grid-based    | 'Test999' Transaction dataset   | New11 Grid-based              |                              | bar        |
      | Balance Sheet | all the datasets and click next | New11 Balance Sheet           |                              | stacked    |
      | Grid-based    | 'Test999' Transaction dataset   | Tg19(){}?/<>[\!@_]#$%+^&*-=,. | Kp3(){}?/<+>[]\!@_#$%^&*-=,. | bar        |
      | Balance Sheet | all the datasets and click next | wV01(){}?/<,>[]\!@_#$%+^&*-=. | Yc9(){?}/<>,[]\!@_#$%+&*-=^. | stacked    |

