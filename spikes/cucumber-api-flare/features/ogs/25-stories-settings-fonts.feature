Feature: Stories settings fonts

  Font choices for use in stories can be set via branding page


  Background:
    Given I am an entity admin
    And there is no branding set for the entity
    And I am on the stories branding settings page

 
  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Proxima Nova

    When I set the "Headline" font to "Proxima Nova"
    And I set the "Paragraph" font to "Proxima Nova"
    And I save the stories settings
    Then the "Headline" font is saved as "proxima-nova"
    And the "Paragraph" font is saved as "proxima-nova"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Benton

    When I set the "Headline" font to "Benton"
    And I set the "Paragraph" font to "Benton"
    And I save the stories settings
    Then the "Headline" font is saved as "benton"
    And the "Paragraph" font is saved as "benton"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Lato

    When I set the "Headline" font to "Lato"
    And I set the "Paragraph" font to "Lato"
    And I save the stories settings
    Then the "Headline" font is saved as "lato"
    And the "Paragraph" font is saved as "lato"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Merriweather

    When I set the "Headline" font to "Merriweather"
    And I set the "Paragraph" font to "Merriweather"
    And I save the stories settings
    Then the "Headline" font is saved as "merriweather"
    And the "Paragraph" font is saved as "merriweather"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Montserrat

    When I set the "Headline" font to "Montserrat"
    And I set the "Paragraph" font to "Montserrat"
    And I save the stories settings
    Then the "Headline" font is saved as "montserrat"
    And the "Paragraph" font is saved as "montserrat"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Open Sans

    When I set the "Headline" font to "Open Sans"
    And I set the "Paragraph" font to "Open Sans"
    And I save the stories settings
    Then the "Headline" font is saved as "open-sans"
    And the "Paragraph" font is saved as "open-sans"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Roboto

    When I set the "Headline" font to "Roboto"
    And I set the "Paragraph" font to "Roboto"
    And I save the stories settings
    Then the "Headline" font is saved as "roboto"
    And the "Paragraph" font is saved as "roboto"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Slabo 27px

    When I set the "Headline" font to "Slabo 27px"
    And I set the "Paragraph" font to "Slabo 27px"
    And I save the stories settings
    Then the "Headline" font is saved as "slabo-27px"
    And the "Paragraph" font is saved as "slabo-27px"


  @OGS-369 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Arial

    When I set the "Headline" font to "Arial"
    And I set the "Paragraph" font to "Arial"
    And I save the stories settings
    Then the "Headline" font is saved as "arial"
    And the "Paragraph" font is saved as "arial"

