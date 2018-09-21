Feature: Stories settings colors

  Color palette can be set for multiple areas of a story and fonts within those areas with dynamic preview


  Background:
    Given I am an entity admin

 
  @OGS-368 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Loads brand colors into UI

    Given there is branding set with colors for the entity
    And I am on the stories branding settings page
    When I do nothing
    Then I should see the correct color groupings


  @OGS-368 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Can save all colors via the UI

    Given there is no branding set for the entity
    And I am on the stories branding settings page
    When I set a complete brand color scheme
    And I save the stories settings
    Then the colors should be set correctly

