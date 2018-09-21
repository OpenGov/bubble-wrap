@wip @surveys
Feature: Manage multiple choice questions

 
  @ORPHAN
  Scenario: Add new question

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions 
    And I add a multiple choice question
    And I save the survey
    Then I see the changes saved hint
    And I see the question as part of the survey


  @ORPHAN
  Scenario: Remove existing question

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question
    When I visit the survey questions
    And I remove the question
    And I save the survey
    Then I see no questions as part of the survey


  @ORPHAN
  Scenario: Unsaved changes message

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question
    When I visit the survey questions
    And I modify the question
    Then I see the unsaved changes hint


  @ORPHAN
  Scenario: Question is required

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question
    When I visit the survey questions
    And I mark the question as required
    And I save the survey
    Then I see the question marked as required


  @ORPHAN
  Scenario: Question is not required

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question marked as required
    When I visit the survey questions
    And I mark the question as not required
    And I save the survey
    Then I see the question marked as not required


  @ORPHAN
  Scenario: Default amount of options for new questions

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey questions
    And I add a multiple choice question
    Then I see 2 options on the multiple choice question


  @ORPHAN
  Scenario: Minimum amount of options for new questions

    Given I am an entity admin
    And there is an existing survey with 1 multiple choice question with 2 options
    When I visit the survey questions
    And I visit the question
    Then I cannot delete any of the options


  @ORPHAN
  Scenario: Add new option

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question
    When I visit the survey questions
    And I add a new option to the multiple choice question
    And I save the survey
    Then I see my new option on the multiple choice question


  @ORPHAN
  Scenario: Remove existing options

    Given I am an entity admin
    And there is an existing survey with 1 multiple choice question with 3 options
    When I visit the survey questions
    And I remove an option from the multiple choice question
    And I save the survey
    Then I see 2 options on the multiple choice question


  @ORPHAN
  Scenario: Changes saved message

    Given I am an entity admin
    And there is an existing survey with 1 "multiple choice" question
    When I visit the survey questions
    And I modify the question
    And I save the survey
    Then I see the changes saved hint

