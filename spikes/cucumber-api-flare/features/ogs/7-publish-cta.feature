Feature: Publish CTA

  Editing a draft has a publish CTA which publishes the story


  Background:
    Given I am an entity admin

 
  @OGS-141 @assignee:hadam_at_opengov.com @COMPLETED @fix
  Scenario: Publish option visible in draft story menu

    Given there is a "draft" story
    When I am on the edit story page
    Then I see the publish CTA


  @OGS-141 @assignee:hadam_at_opengov.com @COMPLETED @fix
  Scenario: Publishing a draft

    Given there is a "draft" story
    When I am on the edit story page
    And I publish the story
    Then the story is published


  @OGS-141 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: Publish option not in published story menu

    Given there is a "published" story
    When I am on the story page
    Then I do not see the publish CTA

