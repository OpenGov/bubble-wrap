@good
Feature: Invitee List

 
  @PMR-38 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: View a dashboard shared with the Organization

    Given I am an entity admin
    And I have a dashboard shared with my organization
    When I visit the shared dashboard
    Then I see "My Organization" in the invitee list


  @PMR-38 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: Invited people are in the invitee list

    Given I am an entity admin
    And there is a publicly shared dashboard
    When I share the dashboard with multiple users
    And I visit the shared dashboard
    Then I see the users I invited


  @PMR-38 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: 'My Organization' is shown in the invitee list when a Dashboard is available to my organization

    Given I am an entity admin
    And there is a publicly shared dashboard
    When I visit the dashboard
    And I toggle to "visible to the organization"
    And I begin to share the dashboard
    Then I see "My Organization" in the invitee list

