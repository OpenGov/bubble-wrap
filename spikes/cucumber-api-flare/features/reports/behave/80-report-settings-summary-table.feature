Feature: Report Settings-Summary Table


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'tzayan' entity
    And I go to reports from visitor_analytics page
    And I select the '311 Service Requests' report
    And I click Settings button

 
  @REP-902 @assignee:epereira @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.9.0.0
  Scenario: General Setting has a Show Summary Table option

    When I select Report Settings 'General' option
    Then I should see 'Show summary table' option


  @REP-1558 @REP-902 @assignee:chad.miller_at_opengov.com @assignee:epereira @version:18.6.3.1 @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.9.0.0
  Scenario: Show Summary Table option is enabled

    When I select Report Settings 'General' option
    And I enable Show summary table option
    And I save the changes
    And I toggle 'Summary' tab from report
    Then I should see 'Summary' tab appears on my report
    And I should see 'Group Description' in the summary table header


  @REP-902 @assignee:epereira @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.9.0.0
  Scenario: Show Summary Table option is disabled

    When I select Report Settings 'General' option
    And I enable Show summary table option
    And I disable Show summary table option
    And I save the changes
    Then I should not see 'Summary' tab appears on my report


  @REP-902 @assignee:epereira @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.9.0.0 @ie
  Scenario: Show Summary Table is enabled and  then canceled

    When I select Report Settings 'General' option
    And I enable Show summary table option
    And I Cancel the changes
    Then I should not see 'Summary' tab appears on my report

