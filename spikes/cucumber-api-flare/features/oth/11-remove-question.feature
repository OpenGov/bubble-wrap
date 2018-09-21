@wip @surveys
Feature: Remove question


  Background:
    Given I am an entity admin
    And there is an existing survey with 1 question

 
  @ORPHAN
  Scenario: Unsaved changes message

    When I visit the survey questions
    And I remove the question
    Then I see the unsaved changes hint


  @ORPHAN
  Scenario: Remove from the list

    When I visit the survey questions
    And I remove the question
    Then I see no questions as part of the survey

