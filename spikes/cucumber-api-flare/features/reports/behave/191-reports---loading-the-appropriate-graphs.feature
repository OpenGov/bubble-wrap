@wip @grid_report @graphs @OLY-296
Feature: Reports - Loading the appropriate graphs


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ibankca' entity
    And I go to reports from visitor_analytics page

 
  @REP-1506 @assignee:epereira @COMPLETED @v1
  Scenario: The default state should be set

    When I select the 'Bond Program, Bonds Issued ' report
    And I click Set default state
    And I click on pie graph
    And I save the report default state
    And I go to reports from report_view page
    And I select the 'Bond Program, Bonds Issued ' report
    Then I should see a pie graphs


  @REP-1506 @assignee:epereira @COMPLETED @v1
  Scenario: The graph type should change

    When I select the 'Bond Program, Bonds Issued ' report
    And I click on pie graph
    And I open Filters panel
    And I select 'Fiscal Year' from 'Add new filter'
    And I insert '2017' in 'Fiscal Year' field
    And I open Filters panel
    And I clear the filter from filters panel
    And I click on bar graph
    Then I should see a bar graphs

