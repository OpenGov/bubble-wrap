@wip
Feature: Share Dashboard Email

 
  @PMR-189 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Writing a custom message

    Given I am an entity admin
    And there is a dashboard
    When I visit the dashboard
    And I begin to share the dashboard
    And add a custom message
    And I complete the share dashboard process
    Then the share dashboard email has the custom message


  @PMR-189 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Share dashboard information

    Given I am an entity admin
    And there is a dashboard
    When I share the dashboard with an existing user
    Then the share dashboard email shows the name of the sharer


  @PMR-189 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Access dashboard from an emailed link

    Given I am an entity admin
    And there is a dashboard
    When I share the dashboard with an existing user
    Then the user can access the dashboard through an emailed link


  @PMR-189 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: A user with no access cannot view the dashboard

    Given I am an entity admin
    And I have a shared dashboard
    When I am a user who does not have access to the dashboard
    Then I cannot access the dashboard through an emailed link

