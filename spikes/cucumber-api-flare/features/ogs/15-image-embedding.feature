Feature: Image embedding

  As a user I can submit the current image media with edits using the Add button. I can cancel my current edits using the Cancel button.


  Background:
    Given I am an entity admin
    And there is a "draft" story
    And there is a media section
    And I am on the edit story page

 
  @OGS-169 @OGS-214 @COMPLETED
  Scenario: Modal opens

    When I start to add an image
    Then I should see the media uploader


  @OGS-214 @COMPLETED
  Scenario: Cancel button closes modal

    When I start to add an image
    And I cancel adding the image
    Then I should not see the media uploader


  @OGS-207 @OGS-208 @OGS-211 @OGS-212 @OGS-213 @OGS-214 @COMPLETED @fix
  Scenario: Add button adds the image into the content module with current edits and close the modal

    When I add an image
    And on the preview I save the image description "LOLcat" and dimensions 400x300
    Then I should see the image embedded with those attributes


  @OGS-351 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Image link

    When I add an image
    And I save the image URL as "http://www.lolcats.com/" on the preview
    Then I should see the linked image embedded

