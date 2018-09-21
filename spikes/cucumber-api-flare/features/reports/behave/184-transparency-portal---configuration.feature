@portal
Feature: Transparency Portal - Configuration


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Gotham' entity
    And I go to Configuration portal section

 
  @ORPHAN
  Scenario: Edit information

    When I edit general information
    Then I should see new information


  @ORPHAN @wip
  Scenario: Upload logo

    When I upload logo
    Then upload process should have finished successfully


  @ORPHAN
  Scenario: Preview

    When I go to Reports portal section
    And I add some report
    And I go to Configuration portal section
    And I click on Preview button
    And I skip welcome tour
    Then I should see preview report


  @ORPHAN
  Scenario: Unpublishing brings up a confirmation modal

    When I go to Reports portal section
    And I add some report
    And I go to Configuration portal section
    And I activate entity
    And the entity is published
    And I deactivate entity
    Then the entity is unpublished

