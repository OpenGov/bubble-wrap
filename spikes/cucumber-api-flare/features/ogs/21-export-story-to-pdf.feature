Feature: Export story to PDF

  Clicking "Export to PDF" will download a PDF file


  Background:
    Given I am an entity admin
    And there is a "draft" story
    And there are story sections "Section 1" and "Section 2"

 
  @OGS-333 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Export to PDF visible

    Given I am on the edit story page
    When I publish the story
    Then the Export to PDF option is visible on the story page


  @OGS-333 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Export to PDF functionality

    Given I am on the edit story page
    When I publish the story
    And I export to PDF
    Then a PDF file is downloaded

