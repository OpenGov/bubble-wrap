@wip @surveys
Feature: Survey featured image upload

 
  @ORPHAN
  Scenario: Add a featured image to a survey

    Given I am an entity admin
    And there is a survey without a featured image
    When I visit surveys
    And I add a featured image to the survey
    And I visit the grid view
    Then I see the survey with a featured image


  @ORPHAN
  Scenario: Remove the featured image from a survey

    Given I am an entity admin
    And there is a survey with a featured image
    When I visit surveys
    And I remove the featured image from the survey
    And I visit the grid view
    Then I do not see a featured image on the survey 


  @ORPHAN
  Scenario: Preview the featured image when editing a survey

    Given I am an entity admin
    And there is a survey with a featured image
    When I visit surveys
    And I visit the survey
    Then I see the featured image preview within the form

