@good
Feature: Add Google Analytics to Dashboard Pages

 
  @PMR-358 @assignee:awong_at_opengov.com @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @COMPLETED
  Scenario: Dashboard Gallery page has Google Analytics enabled

    Given I am an entity user
    When I visit the dashboard gallery
    Then the page has Google Analytics enabled


  @PMR-358 @assignee:awong_at_opengov.com @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @COMPLETED
  Scenario: Add Google Analytics to Dashboard Page

    Given I am an entity user
    And there is a dashboard with a tile
    When I visit the dashboard
    Then the page has Google Analytics enabled


  @PMR-358 @assignee:awong_at_opengov.com @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @COMPLETED
  Scenario: Add Google Analytics to a new dashboard page

    Given I am an entity user
    And there is a publicly shared dashboard
    When I visit the dashboard
    Then the page has Google Analytics enabled

