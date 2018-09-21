@good
Feature: Add Creator to a Dashboard Invitee List

 

  @PMR-351 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: OpenGov users are not added to the invitee list

    Given I am an entity admin
    And I visit the dashboard gallery
    When I create a new dashboard
    And I begin to add invitees
    Then I cannot invite OpenGov users

