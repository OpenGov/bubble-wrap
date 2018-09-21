Feature: Slide addition

  As a user I can add a slide in a story gallery

 
  @OGS-203 @COMPLETED @fix
  Scenario: Add a slide

    Given I am an entity admin
    And there is a "draft" story
    And there is a gallery section
    When I visit the edit story page
    And I add a slide in the gallery section
    Then there should be an extra slide in the gallery section

