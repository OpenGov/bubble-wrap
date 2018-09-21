@good
Feature: Set Dashboards as Public or Private

 
  @PMR-33 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:Private_Dashboards @COMPLETED
  Scenario: New Dashboards Default to Private

    Given I am an entity admin
    And I have created a dashboard
    When I visit the dashboard gallery
    And I open the new dashboard
    Then the dashboard is private


  @PMR-33 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:Private_Dashboards @COMPLETED
  Scenario: Dashboard Admin can toggle from Private to My Organization

    Given I am an entity admin
    And I have created a dashboard
    When I visit the dashboard gallery
    And I open the new dashboard
    And I toggle to "visible to the organization"
    Then the dashboard is visible to the organization


  @PMR-33 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:Private_Dashboards @COMPLETED
  Scenario: Dashboard Admin can toggle from My Organization to Private

    Given I am an entity admin
    And I have created a dashboard
    And the dashboard is "visible to the organization"
    And I visit the dashboard
    When I toggle to "Private"
    Then the dashboard is private


  @PMR-33 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:Private_Dashboards @COMPLETED
  Scenario: Entity users can see their entities' My Organization dashboards

    Given I am an entity user
    And there are dashboards with "My Organization" Visibility
    When I visit the dashboard gallery
    Then I see the organization dashboards


  @PMR-33 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:Private_Dashboards @COMPLETED
  Scenario: Entity admin cannot see Private dashboards

    Given I am an entity admin
    And there are others' dashboards with "Private" visibility
    When I visit the dashboard gallery
    Then I cannot see the private dashboards

