@portal
Feature: Transparency Portal - Engagement

 
  @ORPHAN
  Scenario: Forward feedback to other people

    Given I am logged into metropolis as an entity_admin
    And I go to portal from reports page
    And I go to Engagement portal section
    When I forward feedback
    Then forward process should complete successfully


  @ORPHAN
  Scenario: Visit link

    Given I am logged into metropolis as an entity_admin
    And I go to portal from reports page
    And I go to Engagement portal section
    When I click on Visit page button in feedback
    Then I should see this page


  @ORPHAN @wip
  Scenario: Mark responses as read

    Given I am logged into metropolis as an opengov_admin
    And I go to reports from visitor_analytics page
    And I select the 'Annual' report
    And I create new response
    And I logged out from report_view page
    And I am logged in as an other_entity_admin
    And I go to portal from reports page
    And I go to Engagement portal section
    When I mark new response as read
    Then mark as read process should complete successfully


  @ORPHAN @wip
  Scenario: Delete responses

    Given I am logged into metropolis as an opengov_admin
    And I go to reports from visitor_analytics page
    And I select the 'Annual' report
    And I create new response
    And I logged out from report_view page
    And I am logged in as an other_entity_admin
    And I go to portal from reports page
    And I go to Engagement portal section
    When I delete this response
    Then I shouldn't see this response


  @ORPHAN
  Scenario: Search among responses

    Given I am logged into metropolis as an opengov_admin
    And I go to reports from visitor_analytics page
    And I select the 'Annual' report
    And I create new response
    And I logged out from report_view page
    And I am logged into metropolis as an entity_admin
    And I go to portal from reports page
    And I go to Engagement portal section
    When I search for some response
    Then I should see this response


  @ORPHAN @fix
  Scenario: Cannot see feedback of other entities

    Given I am logged into metropolis as an entity_admin
    When I go to Sausalito Engagement page
    Then I should not see feedback

