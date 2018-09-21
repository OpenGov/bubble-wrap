@surveys
Feature: Landing page for users with no surveys


 
  @OTH-2 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Default landing page when there are no surveys

    Given I am an entity admin
    And I have no surveys
    When I visit surveys
    Then I am prompted to create a new survey


  @OTH-2 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: User sees the default no survey landing page after deleting surveys

    Given I am an entity admin
    And there is 1 survey
    When I visit surveys
    And I delete the survey
    Then I am prompted to create a new survey


  @OTH-2 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: List and Grid Toggle are not displayed if there are no surveys

    Given I am an entity admin
    And I have no surveys
    When I visit surveys
    Then I see a welcome message
    And I do not see the ability to toggle lists and grids

