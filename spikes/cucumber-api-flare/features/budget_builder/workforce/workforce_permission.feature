Feature: Add feature flag: Workforce
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'gotham' entity

  @bvt @wip
  Scenario: Workforce feature is turned on
    When I go to settings from visitor_analytics page
    Then I open 'General' settings tab
    And I enable the following feature flags
      | item1 | workforce |
    And I go to data manager from settings_app page
    Then I should see that 'Workforce Plans' is one of tool options

  @bvt @wip
  Scenario: Workforce landing page format -- there are some workforce plans
    When I go to data manager from visitor_analytics page
    Then I should see that 'Workforce Plans' is one of tool options
    And I click on 'Workforce Plans' on Tools panel
    And I should be on 'WorkforceLanding' page
    Then  I see the column titles are shown correctly on 'WorkforceLanding' page
      | column1 | Name |
      | column2 | Attached Budgets |
      | column3 | Created At |
      | column4 | Updated At |

  @bvt @wip
  Scenario: open first workforce plan
    When I go to data manager from visitor_analytics page
    And I click on 'Workforce Plans' on Tools panel
    And I should be on 'WorkforceLanding' page
    And I open 'Workforce Plan 2018-2019' workforce plan or first one
    And I should be on 'Workforce' page
    Then The page title should be 'Workforce Plan 2018-2019'
