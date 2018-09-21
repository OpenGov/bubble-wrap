@sharing
Feature: Can change access type for Balance Sheet report


  Background:
    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN
  Scenario: Keep reports private until the report owner makes it public

    When I edit access link
    And I select 'Private' type
    Then I should see 'Private' type selected


  @ORPHAN @ie
  Scenario: Can make owned report public to organization

    When I edit access link
    And I select 'My organization' type
    Then I should see 'My organization' type selected


  @ORPHAN
  Scenario: Can make owned report public to network

    When I edit access link
    And I select 'Network' type
    Then I should see 'Network' type selected

