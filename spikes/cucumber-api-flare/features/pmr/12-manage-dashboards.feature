@good
Feature: Manage dashboards


  Background:
    Given I am an entity admin
    And I have created a dashboard

 
  @ORPHAN
  Scenario: Entity admin can delete a dashboard

    
    When I visit the dashboard gallery
    And I delete a dashboard
    Then the dashboard is no longer in the gallery


  @ORPHAN
  Scenario: Entity admin can view a dashboard

    When I visit the dashboard gallery
    And I open the new dashboard
    Then I see dashboard card details


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Entity user cannot rename a dashboard

    When I change to an entity user
    And I visit the dashboard gallery
    Then I cannot rename the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Entity admin can rename a dashboard

    When I visit the dashboard gallery
    And I visit the dashboard gallery
    Then I can rename the dashboard

