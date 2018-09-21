@surveys
Feature: Delete Survey

 
  @OTH-7 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Entity admin can delete a survey

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey settings
    And I begin to delete the survey
    And I confirm deleting the survey
    Then I see a delete confirmation 
    And I do not see the survey


  @OTH-7 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED @wip
  Scenario: Entity user cannot delete surveys

    Given I am an entity user
    And there is an existing survey
    When I visit the survey settings
    Then I do not see the ability to delete the survey


  @OTH-7 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: An admin can cancel the delete survey action

    Given I am an entity admin
    And there is an existing survey
    When I visit the survey settings
    And I begin to delete the survey
    And I cancel the survey deletion
    Then I return to the survey settings page

