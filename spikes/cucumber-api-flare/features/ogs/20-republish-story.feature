Feature: Republish story

  Republish functionality including modal confirmation / dismissal


  Background:
    Given I am an entity admin
    And there is a "published" story
    And there are story sections "Section 1" and "Section 2"
    And the story is then unpublished

 
  @OGS-338 @assignee:nappel_at_opengov.com @COMPLETED @fix
  Scenario: Republish modal visible

    When I publish the story
    Then I should see the republish modal


  @OGS-338 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Close republish modal

    When I publish the story
    And I cancel republishing the story
    Then I should not see the republish modal
    And the story should not be published


  @OGS-338 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Republish confirmation publishes the story

    When I delete section "Section 2"
    And I republish the story
    Then I should not see "Section 2" in the published story contents
    And the story should be published

