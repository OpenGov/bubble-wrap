Feature: Stories advanced settings

  Google Analytics for now

 
  @OGS-392 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Google Analytics Tracking ID

    Given I am an entity admin
    And I am on the stories advanced settings page
    When I set additional Google Analytics
    And I save the branding settings
    Then the Google Analytics tracking ID is saved correctly

