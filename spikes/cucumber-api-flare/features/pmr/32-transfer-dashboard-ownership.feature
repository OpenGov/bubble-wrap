@good
Feature: Transfer Dashboard Ownership

 
  @PMR-364 @assignee:gary.schulte @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @OPEN
  Scenario: Transfer ownership to another user

    Given I am a dashboard owner
    When I transfer dashboard ownership to an invited user
    Then I am returned to the share menu
    And I see the entity user is now the dashboard owner


  @PMR-364 @assignee:gary.schulte @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @OPEN
  Scenario: Cancel the transfer of dashboard ownership

    Given I am a dashboard owner
    When I begin to transfer dashboard ownership
    And I cancel the transfer of dashboard ownership
    Then I am returned to the share menu
    And I see I am still the dashboard owner


  @PMR-364 @assignee:gary.schulte @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @OPEN
  Scenario: Cannot delete dashboard after giving up ownership

    Given I am a dashboard owner
    When I transfer dashboard ownership to an invited user
    Then I can no longer delete the dashboard


  @PMR-364 @assignee:gary.schulte @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @OPEN
  Scenario: Can edit a dashboard after giving up ownership

    Given I am a dashboard owner
    When I transfer dashboard ownership to an invited user
    Then I can still edit the dashboard

