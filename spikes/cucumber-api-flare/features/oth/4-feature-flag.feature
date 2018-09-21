@wip @surveys
Feature: Feature Flag

 
  @ORPHAN
  Scenario: Survey menu item is visible

    Given I am an entity admin
    And the survey feature flag is on
    When I view the application menu
    Then I see the survey menu item


  @ORPHAN
  Scenario: Survey menu item navigates to surveys home page

    Given I am an entity admin
    And the survey feature flag is on
    When I visit surveys
    Then the survey gallery is displayed


  @ORPHAN
  Scenario: Turning surveys off hides survey menu item

    Given I am an entity admin
    And the survey feature flag is off
    When I view the application menu
    Then I do not see the survey menu item

