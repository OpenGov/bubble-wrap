@good
Feature: Invitee Dashboard Access Permissions

 
  @PMR-457 @assignee:cloeper @COMPLETED
  Scenario: Entity user invited to dashboard cannot change permissions

    Given I an entity user
    And I dashboard has been shared with me
    When I view the dashboard
    Then I do not have the ability to change dashboard permissions

