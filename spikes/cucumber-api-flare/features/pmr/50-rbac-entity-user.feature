@RBAC
Feature: RBAC Entity User

 
  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: Entity User cannot create a dashboard

    Given I am an entity user
    When I visit the dashboard gallery
    Then I do not have the ability to create a dashboard


  @ORPHAN
  Scenario: Entity User can see public dashboards

    Given I am an entity user
    And there is a publicly shared dashboard
    When I visit the dashboard gallery
    Then I see the dashboard


  @ORPHAN
  Scenario: Entity User cannot see private dashboard

    Given I am an entity user
    And there is a private shared dashboard
    When I visit the dashboard gallery
    Then I do not see the dashboard


  @ORPHAN
  Scenario: Entity User cannot share a dashboard

    Given I am an entity user
    And there is a publicly shared dashboard
    When I visit the dashboard
    Then I am not able to share the dashboard

