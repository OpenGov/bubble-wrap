Feature: Story contents reordering

  As a user I can move up and move down buttons within each content modules.


  Background:
    Given I am an OpenGov admin
    And there is a "draft" story
    And there are story sections "First section" and "Second section"
    And I am on the edit story page

 
  @OGS-197 @COMPLETED
  Scenario: Move up

    When I move "Second section" up
    Then "Second section" should be above "First section"


  @OGS-198 @COMPLETED
  Scenario: Move down

    When I move "First section" down
    Then "Second section" should be above "First section"

