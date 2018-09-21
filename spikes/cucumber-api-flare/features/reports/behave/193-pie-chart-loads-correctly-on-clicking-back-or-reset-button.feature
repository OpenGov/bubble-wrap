@graphs @grid_report @v1
Feature: Pie chart loads correctly on clicking back or reset button


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page

 
  @REP-1504 @assignee:marinha.pereira_at_opengov.com @COMPLETED @v1 @bug
  Scenario: Pie chart loads correctly on clicking Back button

    When I select the '5 Year Capital Improvement Plan' report
    And I see default chart and legend report data
    And I click on pie graph
    And I click back button
    And I see default chart and legend report data
    And I click on pie graph
    And I see default chart and legend report data
    Then I should see a pie graphs
    And I should see pie chart labels


  @REP-1504 @assignee:marinha.pereira_at_opengov.com @COMPLETED @v1
  Scenario: Pie chart loads correctly on clicking Reset button

    When I select the '5 Year Capital Improvement Plan' report
    And I see default chart and legend report data
    And I click on pie graph
    And I click reset button
    And I see default chart and legend report data
    And I click on pie graph
    And I see default chart and legend report data
    Then I should see a pie graphs
    And I should see pie chart labels

