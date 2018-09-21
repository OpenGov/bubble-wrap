@graphs @grid_report @v1
Feature: Grid Reports - Sort Legends Option


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the '5 Year Capital Improvement Plan' report

 
  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: There should be a sort dropdown for bar and line graph

    When I see default chart and legend report data
    And I click on line graph
    And I see a line graph
    Then I should see legend sort options


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: There should not be a sort dropdown for graphs other then bar or line graph

    When I see default chart and legend report data
    And I click on pie graph
    And I see a pie graph
    Then I should not see legend sort options


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: For bar and line graph type, sort should default to Large to Small

    When I see default chart and legend report data
    Then I should see 'Large to Small' legend sort option selected


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: Sort the legend and the graph in alphabetical order (A to Z)

    When I see default chart and legend report data
    And I see default list of legend items
    And I sort the legends by 'A to Z' order
    Then I should see legend items sorted in alphabetical order


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: Sorts the legend and the graph in reverse alphabetical order (Z to A)

    When I see default chart and legend report data
    And I see default list of legend items
    And I sort the legends by 'Z to A' order
    Then I should see legend items sorted in reverse alphabetical order


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED @fix
  Scenario: Creating a new saved view preserves the legend sort order

    When I sort the legends by 'Z to A' order
    And I see 'Z to A' legend sort option selected
    And I go to Views
    And I create a 'Legends Test' view
    And I sort the legends by 'A to Z' order
    And I see 'A to Z' legend sort option selected
    And I go to Views
    And I select view - 'Legends Test'
    Then I should see the 'Legends Test' view with 'Z to A' option selected


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: Sorting by Large to Small option should show totals in descending order

    When I sort the legends by 'Z to A' order
    And I see 'Z to A' legend sort option selected
    And I sort the legends by 'Large to Small' order
    Then I should see the totals column in the summary table sorted in descending order


  @REP-1514 @assignee:marinha.pereira_at_opengov.com @COMPLETED
  Scenario: Sorting by Small to Large option should show totals in ascending order

    When I sort the legends by 'Z to A' order
    And I see 'Z to A' legend sort option selected
    And I sort the legends by 'Small to Large' order
    Then I should see the totals column in the summary table sorted in ascending order

