@surveys
Feature: Create Survey UI

 
  @OTH-19 @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Create a new empty survey

    Given I am an entity admin
    And I have no surveys
    When I visit surveys
    And I create a blank survey
    Then I see a survey with no title on the surveys page


  @OTH-19 @OTH-34 @assignee:fbrito_at_opengov.com @assignee:ngupte_at_opengov.com @version:Surveys_(Alpha) @COMPLETED
  Scenario: Create a new survey

    Given I am an entity admin
    When I visit surveys
    And I create a survey
    Then I see the survey on the surveys page

