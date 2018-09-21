@RBAC
Feature: RBAC Entity Admin

 
  @PMR-480 @assignee:jmcinerney @COMPLETED
  Scenario: Entity Admin can create a dashboard

    Given I am an entity admin
    When I visit the dashboard gallery
    Then I have the ability to create a dashboard


  @ORPHAN
  Scenario: Entity Admins can see dashboards they create

    Given I am an entity admin
    And I have created a dashboard
    When I visit the dashboard gallery
    Then I can see the dashboard


  @ORPHAN
  Scenario: Entity Admins can edit the dashboards they create

    Given I am an entity admin
    And I have created a dashboard
    When I visit the dashboard
    Then I have the ability to edit the dashboard


  @ORPHAN
  Scenario: Entity Admins can delete the dashboards they create

    Given I am an entity admin
    And I have created a dashboard
    When I visit the dashboard
    Then I have the ability to delete the dashboard


  @ORPHAN
  Scenario: Entity Admins can see public dashboards

    Given I am an entity admin
    And there is a publicly shared dashboard
    When I visit the dashboard gallery
    Then I see the dashboard


  @ORPHAN
  Scenario: Entity Admins can share dashboards with entity users

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And share the dashboard with an entity user
    And the entity user visits the dashboard gallery
    Then the user can see the dashboard


  @ORPHAN
  Scenario: Entity Admins can share dashboards with other entity admins

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And share the dashboard with an entity admin
    And the entity admin visits the dashboard gallery
    Then the user can see the dashboard


  @ORPHAN
  Scenario: Entity Admins can share dashboards with several users

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And I share the dashboard with multiple users
    Then I see a notification the dashboard was shared with the users


  @ORPHAN
  Scenario: Entity Admin can take a dashboard public

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And I change the dashboard privacy level to Organization
    Then I see the dashboard is shared with My Organization


  @ORPHAN
  Scenario: Entity Admin can take a dashboard private

    Given I am an entity admin
    And there is a publicly shared dashboard
    When I visit the dashboard
    And I change the dashboard privacy level to Private
    Then I see the dashboard is not shared with My Organization


  @ORPHAN
  Scenario: Entity Admin can return to private shared dashboard from public

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And I share the dashboard with multiple users
    And I change the dashboard privacy level to Organization
    And I change the dashboard privacy level to Private
    Then I see the dashboard is shared with the multiple users


  @ORPHAN
  Scenario: Bug Entity Admin can take a dashboard public

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And I change the dashboard privacy level to Organization
    And I visit the dashboard
    Then I see the dashboard is shared with My Organization


  @ORPHAN
  Scenario: Invitees persist on subsequent views of invitees in the share panel

    Given I am an entity admin
    And I have created a private shared dashboard
    When I visit the dashboard
    And share the dashboard with an entity user
    And I visit the dashboard
    Then I see the entity user in the invitee list

