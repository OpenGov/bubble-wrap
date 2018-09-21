Feature: Grid Report default state

 
  @SSR-78 @assignee:nmitina @OPEN
  Scenario: Entity Admin can set default state

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged into Tobolsk as an entity_admin
    And I visit the report
    When I select 'Expenses' on Broken Down By filter
    And I select 'Cumulative' amounts settings
    And I click Set default state
    And I save the report default state
    And I should see the following message on report_view page:
    """
    Looking good! This report's default state has been updated
    """
    And I go to reports from report_view page
    And I visit the report
    Then I should see my previous filters changes of default state preserved
      | BROKEN DOWN BY Expenses |
      | AMOUNTS Cumulative      |

