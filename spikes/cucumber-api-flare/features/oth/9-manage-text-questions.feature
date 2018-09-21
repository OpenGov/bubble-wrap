@wip @surveys
Feature: Manage text questions

 
  @ORPHAN
  Scenario: Short answer format

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a text question of type "short answer"
    And I save the survey
    Then I see the "short answer" question as part of the survey


  @ORPHAN
  Scenario: Long answer format

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a text question of type "long answer"
    And I save the survey
    Then I see the "long answer" question as part of the survey


  @ORPHAN
  Scenario: Multiple answers format

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a text question of type "multiple answers"
    And I save the survey
    Then I see the "multiple answers" question as part of the survey


  @ORPHAN
  Scenario: Question is required

    Given I am an entity admin
    And there is an existing survey with 1 "text" question
    When I visit the survey questions
    And I mark the question as required
    And I save the survey
    Then I see the question marked as required


  @ORPHAN
  Scenario: Question is not required

    Given I am an entity admin
    And there is an existing survey with 1 "text" question marked as required
    When I visit the survey questions
    And I mark the question as not required
    And I save the survey
    Then I see the question marked as not required


  @ORPHAN
  Scenario: How many answers do you wish

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a text question of type "multiple answers" 
    And I choose the allowed number of answers as 3
    And I save the survey
    Then I see 3 as the allowed number of answers for the multiple answers text question


  @ORPHAN
  Scenario: Remove existing question

    Given I am an entity admin
    And there is an existing survey with 1 "text" question
    When I visit the survey questions
    And I remove the question
    And I save the survey
    Then I see no questions as part of the survey


  @ORPHAN
  Scenario: Unsaved changes message

    Given I am an entity admin
    And there is an existing survey with 1 "text" question
    When I visit the survey questions
    And I modify the question
    Then I see the unsaved changes hint


  @ORPHAN
  Scenario: Changes saved message

    Given I am an entity admin
    And there is an existing survey with 1 "text" question
    When I visit the survey questions
    And I modify the question
    And I save the survey
    Then I see the changes saved hint


  @ORPHAN
  Scenario: Default answer format

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a text question
    Then I see the "short answer" question as part of the survey

