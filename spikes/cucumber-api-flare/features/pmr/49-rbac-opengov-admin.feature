@RBAC
Feature: RBAC OpenGov Admin

 
  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: An OpenGov Admin can create a dashboard

    Given I am an OpenGov admin
    When I visit the dashboard gallery
    Then I have the ability to create a dashboard


  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: OpenGov Admins can view dashboards they own

    Given I am an OpenGov admin
    And I have created a dashboard
    When I visit the dashboard gallery
    Then I can see the dashboard


  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: OpenGov Admins can update dashboards they own

    Given I am an OpenGov admin
    And I have created a dashboard
    When I visit the dashboard
    Then I have the ability to edit the dashboard


  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: OpenGov Admins can delete dashboards they own

    Given I am an OpenGov admin
    And I have created a dashboard
    When I visit the dashboard
    Then I have the ability to delete the dashboard


  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: OpenGov Admins can view a public dashboard

    Given I am an OpenGov admin
    And there is a publicly shared dashboard
    When I visit the dashboard gallery
    Then I see the dashboard


  @ORPHAN
  Scenario: OpenGov Admins can view private dashboards

    Given I am an OpenGov admin
    And there is a private shared dashboard
    When I visit the dashboard gallery
    Then I see the dashboard

