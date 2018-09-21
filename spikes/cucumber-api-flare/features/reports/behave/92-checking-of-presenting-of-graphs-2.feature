@graphs @ie_1
Feature: Checking of presenting of graphs 2


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @graphs
  Scenario Outline: Show a different type of graphs

    When I select the '<report_type>' report
    And I click on <type> graph
    Then I should see a <graph_type> graphs
    Examples:
      | report_type | type       | graph_type |
      | gr          | line       | line       |
      | gr          | bar        | bar        |
      | gr          | pie        | pie        |
      | bl          | line       | line       |
      | bl          | stacked    | stacked    |
      | bl          | percentage | percentage |
      | bl          | bar        | bar        |
      | bl          | pie        | pie        |

