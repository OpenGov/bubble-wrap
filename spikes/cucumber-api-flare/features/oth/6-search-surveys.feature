@wip @surveys
Feature: Search Surveys

 
  @ORPHAN
  Scenario: Search for a survey by title

    Given I am an entity user
    And there are several surveys
    When I search for a survey
    Then I see the survey in the results list


  @ORPHAN
  Scenario: Search for a non-existing survey

    Given I am an entity user
    And there are several surveys
    When I search for a non-existing survey
    Then I see a message "There are no surveys that match your search."


  @ORPHAN
  Scenario: Search for a deleted survey

    Given I am an entity user
    When I search for a deleted survey
    Then I do not see the survey in the results list

