Feature: Copy to template

  Save / Cancel edits and template creation


  Background:
    Given I am an OpenGov admin
    And there is a "draft" story
    And I am on the edit story page

 
  @OGS-149 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: Copy to template

    When I open story settings -> copy to template
    And I fill in template "Title" with "Test template title"
    And I fill in template "Description" with "Test template description"
    And I follow the Copy CTA
    Then the story is copied to a template


  @OGS-149 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: Cancel edits

    When I open story settings -> copy to template
    And I fill in template "Title" with "Test template title"
    And I fill in template "Description" with "Test template description"
    And I cancel copy to template
    Then the story is not copied to a template

