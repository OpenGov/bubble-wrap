@surveys
Feature: List and Grid Toggle


  Background:
    Given I am an entity admin
    And there is an existing survey

 
  @OTH-3 @OTH-4 @assignee:fbrito_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: User sees grid view by default

    When I visit surveys
    Then I see the grid view


  @OTH-3 @OTH-4 @assignee:fbrito_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: User can toggle to list view

    When I visit surveys
    And I set the view as grid view
    And I toggle view types
    Then I see the list view


  @OTH-3 @OTH-4 @assignee:fbrito_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: User can toggle to grid view

    When I visit surveys
    And I set the view as list view
    And I toggle view types
    Then I see the grid view

