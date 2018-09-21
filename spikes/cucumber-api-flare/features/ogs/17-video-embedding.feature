Feature: Video embedding

    As a user I can submit a video with edits using the Add button. I can cancel my current edits using the Cancel button.


  Background:
    Given I am an entity admin
    And there is a "draft" story
    And there is a media section
    And I am on the edit story page

 
  @OGS-169 @OGS-177 @COMPLETED
  Scenario: Modal opens

    When I start to add a video
    Then I should see the media uploader


  @OGS-177 @OGS-214 @COMPLETED
  Scenario: Cancel button closes modal

    When I start to add a video
    And I cancel adding the video
    Then I should not see the media uploader


  @OGS-207 @OGS-208 @OGS-210 @OGS-211 @OGS-214 @COMPLETED @fix
  Scenario: Add button adds the video into the content module with current edits and close the modal

    When I add a video
    And on the preview I save the video description "San Fran" and transcript URL "https://www.lyrics.com/lyric/4658337/Frank+Sinatra/I+Left+My+Heart+in+San+Francisco"
    Then I should see the video embedded with the description "San Fran"
    And I should see the video transcript link to "https://www.lyrics.com/lyric/4658337/Frank+Sinatra/I+Left+My+Heart+in+San+Francisco"

