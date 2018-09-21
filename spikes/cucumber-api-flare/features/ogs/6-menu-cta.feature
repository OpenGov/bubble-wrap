Feature: Menu CTA

  Menu CTA in story header: "Save Story" (draft only) | "Unpublish Story" (published only) | "Delete Story"


  Background:
    Given I am an entity admin

 
  @OGS-136 @COMPLETED
  Scenario: Menu CTA visible in story header

    Given there is a "draft" story
    When I visit the edit story page
    Then I see the menu CTA


  @OGS-136 @COMPLETED
  Scenario: Save story on edit draft page

    Given there is a "draft" story
    And I am on the edit story page
    When I save the story
    Then the story is saved


  @OGS-136 @COMPLETED
  Scenario: Save story not on published stories

    Given there is a "published" story
    When I am on the edit story page
    Then I should not see the Save Story option


  @OGS-136 @COMPLETED
  Scenario: Unpublish on published story

    Given there is a "published" story
    And I am on the story page
    When I unpublish the story
    Then the story is unpublished


  @OGS-136 @COMPLETED
  Scenario: Unpublish not on draft stories

    Given there is a "draft" story
    When I visit the edit story page
    Then I should not see the Unpublish Story option


  @OGS-136 @COMPLETED
  Scenario: Delete draft story

    Given there is a "draft" story
    And I am on the edit story page
    When I delete the story
    Then the story is deleted


  @OGS-136 @COMPLETED
  Scenario: Delete published story

    Given there is a "published" story
    And I am on the edit story page
    When I delete the story
    Then the story is deleted

