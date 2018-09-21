Feature: Update a Workforce Plan
  Background:
    Given I turn on workforce feature for 'gotham' entity
    And I am logged into gotham as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel
    And I creat a workforce plan
    And I select the workforce plan

  Scenario: Verify workforce name update
    When I click on settings
    And I modify '' and save
    Then I see the new name is displayed on workforce list

  Scenario: Upload a completed template will override the existing WF plan
    When I upload template ''
    And I see the position list updated
    Then I see cost element updated

  Scenario: Verify a forecast updated after modifying a cost element
    When  I upload a completed template
    And I select Cost Elements tab
    And I select Hourly Wage cost element
    And modify amount and save
    And I select Positions tab
    And I select a position with Hourly Wage cost element
    And I see the value of Hourly Wage is updated
    Then I see the change in Projected Total Cost
