Feature: Stories settings logos

  Logo can be configured for the entity in both the header and footer


  Background:
    Given I am an entity admin
    And there is no branding set for the entity
    And I am on the stories branding settings page

 
  @OGS-360 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Logo placement header-only

    When I choose logo placement: header-only
    And I add a logo
    And I save the stories settings
    Then the logo placement is saved correctly
    And the logo file settings are saved correctly


  @OGS-360 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Logo placement footer-only

    When I choose logo placement: footer-only
    And I add a logo
    And I save the stories settings
    Then the logo placement is saved correctly
    And the logo file settings are saved correctly


  @OGS-360 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Logo placement header and footer

    When I choose logo placement: shared header and footer logo
    And I add a logo
    And I save the stories settings
    Then the logo placement is saved correctly
    And the logo file settings are saved correctly


  @OGS-360 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Logo placement header with unique footer

    When I choose logo placement: unique header and footer logos
    And I add both logos
    And I save the stories settings
    Then the logo placement is saved correctly
    And the logo file settings are saved correctly


  @OGS-360 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Logos removal

    Given there is branding set with unique header and footer logos
    When I remove both logos
    And I save the stories settings
    Then the logo removal is saved

