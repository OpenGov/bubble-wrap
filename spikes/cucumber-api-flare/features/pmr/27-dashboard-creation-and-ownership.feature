@wip @good
Feature: Dashboard Creation and Ownership

 
  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Entity admins are owners of the dashboards they create

    Given I am an entity admin
    When I create a dashboard
    Then I am the owner of the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Dashboard owners can delete dashboards

    Given I am an entity admin
    And I am the owner of a dashboard I created
    When I delete the dashboard
    Then I do not see the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Entity admin cannot delete dashboards owned by someone else

    Given I am an entity admin
    And there is a dashboard I do not own
    When I visit the dashboard
    Then I cannot delete the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: An entity user cannot delete a dashboard

    Given I am an entity user
    And there is a dashboard I do not own
    When I visit the dashboard
    Then I cannot delete the dashboard


  @ORPHAN
  Scenario: An entity user cannot edit a dashboard

    Given I am an entity user
    And there is a dashboard I do not own
    When I visit the dashboard
    Then I cannot edit the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: An entity user can own a dashboard

    Given I am an entity user
    And there is a dashboard I do not own
    When I have ownership given to me
    And I visit the dashboard
    Then I can rename the dashboard


  @PMR-351 @assignee:cloeper @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Entity users can delete dashboards they own

    Given I am an entity user
    And there is a dashboard I do not own
    When I have ownership given to me
    And I visit the dashboard
    Then I have the ability to delete the dashboard


  @PMR-348 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Permissioning_(Dashboards) @COMPLETED
  Scenario: Invited users are shown when a Dashboard is Private

    Given I am an entity admin
    And there is a private dashboard
    When I visit the dashboard
    And I begin to share the dashboard
    Then I see the invitee list


  @ORPHAN
  Scenario: Entity admins cannot delete dashboards they create but transfer ownership to someone else

    Given I am an entity admin
    And I am the owner of a dashboard I created
    When I transfer dashboard ownership to someone else
    And I visit the dashboard
    Then I cannot delete the dashboard

