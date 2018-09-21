Feature: Social sharing

  Published stories can be shared on Facebook and Twitter with the correct metadata for corresponding previews


  Background:
    Given I am an entity admin
    And there is a fully published story with content

 
  @OGS-397 @OGS-398 @OGS-418 @assignee:hadam_at_opengov.com @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Meta tags

    When I am on the published story page
    Then there is social metadata embedded


  @OGS-397 @OGS-398 @OGS-418 @assignee:hadam_at_opengov.com @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Social network links to Facebook and Twitter

    When I am on the published story page
    Then there is a Facebook link to the published story
    And there is a Twitter link to the published story

