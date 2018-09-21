@portal
Feature: Transparency Portal - Supporting documents


  Background:
    Given I am logged into metropolis as an entity_admin
    And I go to portal from reports page
    And I go to Supporting Documents portal section

 
  @ORPHAN @fix
  Scenario: Add document

    When I add new document
    Then I should see it in the list


  @ORPHAN @fix
  Scenario: Preview supporting documents

    Given there are some supporting documents
    When I click on Preview on Supporting documents page
    And I skip transparency report welcome tour
    Then I should see supporting documents


  @ORPHAN @fix
  Scenario: Make changes to supporting documents

    Given there are some supporting documents
    When I change some document title
    Then I should see new title


  @ORPHAN @fix
  Scenario: Reorder supporting documents

    Given there are some supporting documents
    When I reorder the documents on the page
    Then I should see new order of documents


  @ORPHAN @fix
  Scenario: Remove supporting documents

    When I add new document
    And I delete this document
    Then I shouldn't see documents in the list

