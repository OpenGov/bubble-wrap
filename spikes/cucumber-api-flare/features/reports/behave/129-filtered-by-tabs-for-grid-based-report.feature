Feature: Filtered by tabs for Grid-based Report

 
  @ORPHAN @filters @ie
  Scenario Outline: Filtered by tabs for Grid-based report

    Given I have a Grid report using the "Test999" transaction dataset in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I visit the report
    And I select '<select>' filtered by element
    Then I should see '<see>' tab
    Examples:
      | select     | see        |
      | Filters    | Filters    |
      | Columns    | Columns    |
      | Aggregates | Aggregates |

