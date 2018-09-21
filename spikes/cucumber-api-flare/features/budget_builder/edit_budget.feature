Feature: Edit budgets

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: Rename budget
    When I visit budget settings
    And I rename budget to ''
    Then I should see the following message on budget_builder page:
    """
    Budget successfully updated! Budget title updated.
    """
    And I should see new budget name

  @p1
  Scenario: Change Budget Year
    When I visit budget settings
    And I change budget year
    Then I should see the following message on budget_builder page:
    """
    Budget successfully updated! Budget year updated.
    """
    And I should see new budget year

  @bvt @frictionless
  Scenario: Delete budget
    When I visit budget settings
    And I start to delete this budget
    And I confirm deletion
    Then I can't find this budget

  @p1
  Scenario: Confirmation tab appeared when delete budget
    When I visit budget settings
    And I start to delete this budget
    Then I see confirmation tab
    # added the step below for cleaning up
    And I confirm deletion
    # the step above is for cleaning up