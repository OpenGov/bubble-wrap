Feature: Multi-period budget cloning

  Background:
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page

  @p1
  Scenario: Clone a Multi-period Roll-Forward Adjustment Budget
    Given I have created a '2' periods budget with 'roll-forward' adjustments and '' dataset
    And I clone a multi-period budget
    Then I see the new budget has same periods as the cloned budget
    And I set new period names
    And I cloned a budget
    And I wait 50 seconds
    And I search for the clone budget
    And I select the clone budget
    And I visit budget settings
    Then I see the new period names in new budget's settings panel

  # can be replaced by budget_cloning_smoke
  Scenario: Clone a Multi-period fixed-base Budget with blank period names
    Given I have created a '3' periods budget with 'fixed-base' adjustments and '' dataset
    And I clone a multi-period budget
    Then I see the new budget has same periods as the cloned budget
    And I erase all period names on the budget creation panel
    And I cloned a budget
    And I wait 50 seconds
    And I search for the clone budget
    And I select the clone budget
    And I visit budget settings
    Then I see the period names of cloned budget in the new budget's settings panel


