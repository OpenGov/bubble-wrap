Feature: Story contents delete

  As a user I can delete a storyContent using a button in the content menu.

 
  @OGS-204 @COMPLETED
  Scenario: Delete

    Given I am an entity admin
    And there is a "draft" story
    And there are story sections "First section" and "Second section"
    When I visit the edit story page
    And I delete section "Second section"
    Then I should see section "First section"
    And I should not see section "Second section"

