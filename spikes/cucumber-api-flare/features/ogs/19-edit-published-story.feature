Feature: Edit published story

  Editing a published story via Edit button on story page


  Background:
    Given I am an entity admin
    And there is a published story with content

 
  @OGS-334 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Edit button visible

    When I am on the story page
    Then I should see the Edit CTA


  @OGS-334 @OGS-406 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Editing a published does not unpublish the story

    When I am on the story page
    And I edit the story
    Then I should be on the edit story page
    And the story should be published

