Feature: Story settings modal

  As a user I can submit my current edits using the Save button. I can cancel my current edits using the Cancel button.


  Background:
    Given I am an OpenGov admin
    And there is a "draft" story
    And I am on the edit story page

 
  @OGS-127 @COMPLETED
  Scenario: Save edits

    When I open story settings
    And I fill in settings "Title" with "Test title"
    And I fill in settings "Description" with "Test description"
    And I follow the save settings CTA
    Then the settings are saved


  @OGS-127 @COMPLETED
  Scenario: Cancel edits

    When I open story settings
    And I fill in settings "Title" with "Test title"
    And I fill in settings "Description" with "Test description"
    And I cancel saving settings
    Then the settings are not saved

