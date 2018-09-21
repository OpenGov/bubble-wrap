@surveys
Feature: Add and Save Introduction

 
  @OTH-21 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Complete the Introduction tab

    Given I am an entity admin
    And I visit surveys
    When I create a blank survey
    And I fill in the introduction fields
    And I save the survey
    Then I see the new saved title in the breadcrumb


  @OTH-21 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: A survey title with no text

    Given I am an entity admin
    And I visit surveys
    When I create a blank survey
    And I fill in the title with no text
    And I save the survey
    Then I see the untitled breadcrumb


  @OTH-21 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: The introduction tab saves all changes

    Given I am an entity admin
    And I visit surveys
    When I create a survey
    And I visit surveys
    And I visit the survey
    Then I see the introduction fields filled in


  @OTH-21 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Unsaved changes message

    Given I am an entity admin
    And I visit surveys
    When I create a blank survey
    And I fill in the introduction fields
    Then I see the unsaved changes hint


  @OTH-21 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Changes saved message

    Given I am an entity admin
    And I visit surveys
    When I create a survey
    Then I see the changes saved hint

