@good
Feature: Create Dashboard

 
  @ORPHAN
  Scenario: An entity admin can create a dashboard

    Given I am an entity admin
    When I visit the dashboard gallery
    And I create a new dashboard
    And I visit the dashboard gallery
    Then the new dashboard is displayed


  @ORPHAN
  Scenario: Cancel dashboard creation

    Given I am an entity admin
    When I visit the dashboard gallery
    And I begin to create a new dashboard
    And I cancel the dashboard creation
    Then a new dashboard is not displayed


  @ORPHAN
  Scenario: A dashboard does not require a name

    Given I am an entity admin
    When I visit the dashboard gallery
    And I begin to create a new dashboard
    And I do not enter a dashboard name
    And I continue to the next dashboard creation step
    Then I see the dashboard with a default name


  @ORPHAN
  Scenario: Entity user cannot create a dashboard

    Given I am an entity user
    When I visit the dashboard gallery
    Then I cannot create a dashboard

