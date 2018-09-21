Feature: Create a new budget

  Background:


  @bvt @ci-smoke
  Scenario: Create a budget
    When I am logged into gotham as an entity_admin
    And I go to budgets from reports page
    And I have created a budget via UI
    And I search for the budget
    Then the budget appears in the budget list

  @p2 @frictionless
  Scenario: Canceling a new budget creation process
    When I am logged into gotham as an entity_admin
    And I go to budgets from reports page
    And I begin to create a budget with the workforce
    And I cancel the budget creation
    Then the budget builder panel closes

  @p1
  Scenario: Workforce 'Get Started' button is present
    When I turn on workforce feature for 'metropolis' entity
    And I am logged into metropolis as an entity_admin
    And I go to budgets from reports page
    And I open budget creation panel
    Then Workforce 'Get Started' button is present

  @bvt
  Scenario: Create a budget with a link to a workforce
    When I turn on workforce feature for 'gotham' entity
    And I am logged into gotham as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel
    And I start to create a new workforce plan
    And I go to budgets from data_manager page
    And I begin to create a budget with the workforce
    And I confirm the budget creation
    And I visit budget settings
    Then I see the workforce plan

   @p1
   Scenario: Create a budget without a link to a workforce
    When I am logged into gotham as an entity_admin
    And I go to budgets from reports page
    And I have created a budget via UI
    And I visit budget settings
    Then I do not see a workforce plan in budget settings
