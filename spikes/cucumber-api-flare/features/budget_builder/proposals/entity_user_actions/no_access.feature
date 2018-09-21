Feature: Entity user actions with 'No access'

  Scenario: Entity user has no access to budget see budget landing page
    Given I am logged into gotham as an entity_user
    And I go to budgets from reports page
    Then I see a budget welcome page without a create budget button
