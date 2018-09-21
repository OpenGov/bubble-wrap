Feature: HTML embedding

  As a user I can add the embed code to the content module using the Submit button. I can cancel my current edits using the Cancel button


  Background:
    Given I am an entity admin
    And there is a "draft" story
    And there is a media section
    And I am on the edit story page

 
  @OGS-216 @COMPLETED
  Scenario: Modal opens

    When I start to embed
    Then I should see the embed modal


  @OGS-216 @COMPLETED
  Scenario: Modal closes

    When I start to embed
    And I cancel embed
    Then I should not see the embed modal


  @OGS-216 @OGS-299 @COMPLETED
  Scenario: Submit adds embed code to content

    When I embed an iframe
    Then the iframe is embedded

