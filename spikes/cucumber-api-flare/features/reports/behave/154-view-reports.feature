@view
Feature: View reports


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page

 
  @ORPHAN
  Scenario: View a Sausalito bar graph

    When I select the 'Annual Balance Sheets' report
    And I view a bar graph
    Then I should see a bar graphs


  @ORPHAN @ie
  Scenario: Switching to a bar graph

    When I select the 'Annual Revenues and Expenses' report
    And I view a bar graph
    Then I should see bars for fiscal years
    And the bars should have heights

