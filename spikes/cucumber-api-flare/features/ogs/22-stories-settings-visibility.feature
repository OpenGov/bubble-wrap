Feature: Stories settings visibility

  Settings icon visible to entity admins and OG admins only

 
  @OGS-358 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Settings hidden to entity user

    Given I am an entity user
    When I visit stories
    Then I should not see the settings icon


  @OGS-358 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Settings visible to entity admin

    Given I am an entity admin
    When I visit stories
    Then I should see the settings icon


  @OGS-358 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Settings visible to OG admin

    Given I am an OpenGov admin
    When I visit stories
    Then I should see the settings icon


  @OGS-358 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Branding page loads from link

    Given I am an OpenGov admin
    And I am on the stories dashboard
    When I follow settings
    Then I am taken to the branding settings page


  @OGS-361 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Back to dashboard from branding page

    Given I am an OpenGov admin
    And I am on the stories branding settings page
    When I follow the back to dashboard CTA
    Then I am taken to the stories dashboard

