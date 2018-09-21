@toggle
Feature: Report Toggle option


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'anokacountymn' entity
    And I go to reports from visitor_analytics page
    And I select the 'Annual Budget (Internal)' report
    And Scaling per capita is on

 
  @OLY-304 @assignee:marinha.pereira_at_opengov.com @version:17.9.0.0 @COMPLETED @version:17.9.0.0 @ie
  Scenario: Scale option enable on toggling account codes on

    When I toggle account codes on
    Then toggle account code is enabled
    And scaling option should not get turned off


  @OLY-304 @assignee:marinha.pereira_at_opengov.com @version:17.9.0.0 @COMPLETED @version:17.9.0.0
  Scenario: Scale option enable on toggling account codes off

    When I toggle account codes on
    And I toggle account codes off
    Then toggle account code is disabled
    And scaling option should not get turned off

