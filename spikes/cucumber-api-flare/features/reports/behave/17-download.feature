@download @gl_report
Feature: Download

 
  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @ie
  Scenario: GL Report - Download button present_EntityUser

    Given I am logged into Tobolsk as an entity_user
    When I select the 'mn' report  
    Then I should see Download 


  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED
  Scenario: GL  Report -Download drop down list present_EntityUser

    Given I am logged into Tobolsk as an entity_user
    And I select the 'mn' report  
    When I click on Download button 
    Then I should see Download drop down list


  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED
  Scenario: GL Report -Export tables to csv_EntityUser

    Given I am logged into Tobolsk as an entity_user
    And I select the 'mn' report  
    When I click on Download button 
    Then I should be able to export data in 'Spreadsheet (.csv)' format


  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @ie
  Scenario: GL Report -Export tables to png_EntityUser

    Given I am logged into Tobolsk as an entity_user
    And I select the 'mn' report
    When I click on Download button 
    Then I should not be able to export data in 'Table (.png)' format


  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED
  Scenario: GL Report -Export charts to png_EntityUser

    Given I am logged into Tobolsk as an entity_user
    And I select the 'mn' report
    When I click on Download button 
    Then I should be able to export data in 'Image (.png) ' format


  @REP-887 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED
  Scenario: GL Report - Download button present_OpenGovAdmin

    Given I am logged on as an OpenGov admin
    And I am in a 'Tobolsk' entity
    And I go to reports from visitor_analytics page
    When I select the 'mn' report  
    Then I should see Download

