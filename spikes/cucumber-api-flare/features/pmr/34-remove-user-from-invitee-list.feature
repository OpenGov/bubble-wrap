@good
Feature: Remove user from invitee list

 
  @PMR-365 @assignee:cloeper @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @WIP
  Scenario: Opengov employee who owns a dashboard can remove users

    Given I am an opengov employee
    And I am a dashboard owner
    When I remove a user from the list
    Then the user no longer has access to the dashboard


  @PMR-365 @assignee:cloeper @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @WIP
  Scenario: Entity Admin who owns a dashboard can remove users

    Given I am an entity admin
    And I am a dashboard owner
    When I remove a user from the list
    Then the user no longer has access to the dashboard


  @PMR-365 @assignee:cloeper @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @WIP
  Scenario: Entity user who owns a dashboard can remove users

    Given I am an entity user
    And I am a dashboard owner
    When I remove a user from the list
    Then the user no longer has access to the dashboard


  @PMR-365 @assignee:cloeper @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @WIP
  Scenario: Dashboard owners may not change their permissions

    Given I am a dashboard owner
    When I view the invitee list
    Then I cannot change my permissions

