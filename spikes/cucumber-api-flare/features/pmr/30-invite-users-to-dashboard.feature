@good
Feature: Invite Users to Dashboard

 
  @PMR-372 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Invite a user that triggers an unsuccessful message for invitation sent

    Given I am an entity admin
    And I visit the dashboard gallery
    And I am a dashboard owner
    When I share the dashboard with a bad user
    Then I see a notification for an invitation sent unsuccessfully


  @PMR-372 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Notification sent

    Given I am an entity admin
    And I visit the dashboard gallery
    And I am a dashboard owner
    When I share the dashboard with others
    Then I see a notification the invitation was sent successfully

