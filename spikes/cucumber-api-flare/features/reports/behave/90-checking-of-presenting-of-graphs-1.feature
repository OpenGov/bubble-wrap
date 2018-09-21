Feature: Checking of presenting of graphs 1


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @graphs
  Scenario Outline: Show a different type of graphs

    When I select the '<report_type>' report
    And I click on <type> graph
    Then I should see a <graph_type> graphs
    Examples:
      | report_type | type       | graph_type |
      | mn          | line       | line       |
      | mn          | stacked    | stacked    |
      | mn          | percentage | percentage |
      | mn          | bar        | bar        |
      | mn          | pie        | pie        |
      | std         | line       | line       |
      | std         | stacked    | stacked    |
      | std         | percentage | percentage |
      | std         | bar        | bar        |
      | std         | pie        | pie        |

