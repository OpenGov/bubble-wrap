Feature: General Ledger Home Page

  Background:
    Given I am logged into default_subdomain as an entity_admin
    And I go to data manager from reports page
    And I go to general ledgers page
#    And I select 'Chart of Accounts - 2015-08-15' coa

  @bvt @compatible @phantom
  Scenario: Ability to import annotations
    When I import annotations
    Then I see new annotations
