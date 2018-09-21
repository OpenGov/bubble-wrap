Feature: Create Tiles

  There are four types of reports
  * Organization
  * Private
  * Network
  * Public

 
  @ORPHAN
  Scenario: Entity Admin can create a tile with a report from a Organization report

    Given I am an entity admin
    And there is an organization report I have access to
    And I visit the dashboard gallery
    When I create a new dashboard
    And I create a tile with the report
    Then I can see the new tile


  @ORPHAN
  Scenario: Entity Admin can NOT create a tile with a report from a Private report

    Given I am an entity admin
    And I visit the dashboard gallery
    And there is a private report I do not have access to
    When I create a new dashboard
    Then I cannot select the private report


  @ORPHAN
  Scenario: Entity Admin can create a tile with a report from a Network report

    Given I am an entity admin
    And I visit the dashboard gallery
    And there is a network report I have access to
    When I create a new dashboard
    And I create a tile with the report
    Then I can see the new tile


  @ORPHAN @bug
  Scenario: Entity User can NOT create Tiles

    Given I am an entity user
    And there is a publicly shared dashboard
    When I visit the dashboard gallery
    And I select the dashboard
    Then I cannot create tiles


  @ORPHAN
  Scenario: Entity Admin can create tile from edit menu

    Given I am an entity admin
    And there is a dashboard with a tile
    When I visit the dashboard gallery
    And I edit the dashboard
    And I add a tile from the menu
    Then I can see the new tile


  @ORPHAN
  Scenario: Entity Admin can create a tile with a report from a Public report

    Given I am an entity admin
    And I visit the dashboard gallery
    And there is a public report I have access to
    When I create a new dashboard
    And I create a tile with the report
    Then I can see the new tile


  @ORPHAN
  Scenario: Entity Admin can create more than one tile

    Given I am an entity admin
    And there is a publicly shared dashboard
    When I visit the dashboard gallery
    And I select the dashboard
    And I create a MoM tile
    Then I have the ability to add another tile

