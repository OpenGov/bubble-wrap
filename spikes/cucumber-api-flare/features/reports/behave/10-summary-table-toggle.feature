@tab @grid_report
Feature: Summary Table Toggle


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'fairbornoh' entity
    And I go to reports from visitor_analytics page
    And I begin to create a 'Grid-based' report
    And I select 'Transactions (Linked)' Transaction dataset
    And I fill in the report information
    And I create the report

 
  @REP-883 @assignee:nbuccam_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @ie
  Scenario: In grid report both Summary and Details tabs are shown 

    When I click Settings button
    And I select Report Settings 'General' option
    And I enable Show summary table option
    And I save the changes
    Then I should see 'Summary' tab appears on my report
    And I should see 'Details' tab appears on my report


  @REP-883 @assignee:nbuccam_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED
  Scenario: By default in grid report only Records tab is shown

    Then I should see 'Records' tab appears on my report
    And I should not see 'Summary' tab appears on my report


  @REP-883 @assignee:nbuccam_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED
  Scenario: Toggle summary tab

    When I click Settings button
    And I select Report Settings 'General' option
    And I enable Show summary table option
    And I save the changes
    And I toggle 'Summary' tab from report
    Then Summary tab is opened


  @REP-883 @assignee:nbuccam_at_opengov.com @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED
  Scenario: Toggle details tab

    When I click Settings button
    And I select Report Settings 'General' option
    And I enable Show summary table option
    And I save the changes
    And I toggle 'Details' tab from report
    Then Details tab is opened

