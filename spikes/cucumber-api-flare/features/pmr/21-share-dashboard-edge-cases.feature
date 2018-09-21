@good
Feature: Share Dashboard edge cases


  Background:
    Given I am an entity admin
    And I have created a dashboard
    And I visit the dashboard

 
  @PMR-250 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Nonexistent recipient

    When I begin to share the dashboard
    And I search for a nonexistent recipient
    Then I see the No Recipient Results component


  @PMR-250 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Minimum characters for recipient lookup

    When I begin to share the dashboard
    And I enter a single character in the recipient search
    Then I can see entity users whose name or email contain that character


  @PMR-250 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.2 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Add the same recipient twice

    When I add a recipient
    And I search for the same recipient
    Then I do not see the recipient in the results

