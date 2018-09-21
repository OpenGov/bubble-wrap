@good
Feature: Dashboard Edit

 
  @PMR-333 @assignee:renee.kim @COMPLETED
  Scenario: Entity User Does Not See Gear Icon

    Given I am an entity user
    And there is a dashboard with a tile
    When I visit the dashboard
    Then I do not see the gear icon


  @PMR-333 @assignee:renee.kim @COMPLETED
  Scenario: Entity Admin Sees Gear Icon

    Given I am an entity admin
    And there is a dashboard with a tile
    When I visit the dashboard
    Then I see the gear icon

