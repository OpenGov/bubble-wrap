@good
Feature: Invitee Status

 
  @PMR-352 @assignee:cloeper @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Searching for person who is already invited to the dashboard

    Given I am an entity admin
    And I have created a dashboard
    And the dashboard has invitees
    When I visit the dashboard
    And I search for a person already invited
    Then I should not see the person in the invitee list

