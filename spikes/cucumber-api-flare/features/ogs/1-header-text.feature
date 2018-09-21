Feature: Header Text

  Ensure the Stories link is in the sidebar and goes to the stories homepage


  Background:
    Given I am an entity admin

 
  @OGS-116 @COMPLETED
  Scenario: "Stories" link visible in sidebar

    When I visit stories
    Then I see stories in the sidebar


  @OGS-116 @COMPLETED
  Scenario: "Stories" link goes to stories homepage for entity

    When I follow the stories sidebar link
    Then I am on the stories homepage

