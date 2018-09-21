Feature: Save button visibility while activating default state


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page
    And I select the '5 Year Capital Improvement Plan' report

 
  @OLY-405 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0 @ie
  Scenario: Save button amount panel

    When I click Set default state
    And I open Amounts column panel
    Then I should see save button displayed in 'Amounts' column panel


  @OLY-405 @assignee:pnair @version:18.1.1 @COMPLETED @filters @version:17.9.0.0
  Scenario: Save button breakdown panel

    When I click Set default state
    And I open Breakdown column panel
    Then I should see save button displayed in 'Breakdown' column panel

