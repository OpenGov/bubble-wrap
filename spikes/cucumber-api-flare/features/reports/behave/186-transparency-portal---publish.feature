@portal
Feature: Transparency Portal - Publish


  Background:
    Given I am logged into gotham as an opengov_admin
    And I go to Configuration portal section
    And I check entity publishing

 
  @ORPHAN
  Scenario: Need 1 report to publish

    When I click on activate entity button
    Then I should see following text:
      """
      You must include at least one report in your Transparency Portal before activating your site.
      """


  @ORPHAN
  Scenario: Changes must be submitted before publishing

    When I add some report
    And I click on activate entity button
    Then I should see following text:
      """
      You must save all of your changes before publishing.
      """


  @ORPHAN
  Scenario: Publishing brings up confirmation modal

    When I add some report
    And I click on activate entity button
    Then I should see confirmation modal


  @ORPHAN
  Scenario: Publish

    When I add some report
    And I activate entity
    Then the entity is published

