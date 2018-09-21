@wip # redshift entity
Feature: West Virginia report

  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'westvirginia' entity
    And I go to reports from visitor_analytics page
    And I begin to create a 'Grid-based' report
    And I select 'WV Annual Data Columnar' Transaction dataset
    And I fill in the report information
    And I create the report

  Scenario: measure load report table
    Then I should see report grid-table

  Scenario: measure filters updates (show option)
    When I select 'Fiscal Year' option on Show filter
    Then I should see 'Fiscal Year' data in report

  Scenario: measure filters updates (filtered by Filters)
    When I select 'Filters' filtered by element
    And I select 'Departments' from 'Add new filter'
    And I insert 'DIVISION OF HUMAN SERVICES' in 'Departments' field
    Then I should see 'DIVISION OF HUMAN SERVICES' data in report

  Scenario: measure filters updates (filtered by Columns)
    When I select 'Columns' filtered by element
    And I uncheck all filters
    Then I should see 'PSTNG_AM ($)' data in report

  Scenario: measure filters updates (filtered by Aggregates)
    When I select 'Aggregates' filtered by element
    And I calculate 'PSTNG_AM ($)' for '100 to 1 k'
    Then I should see '100 to 1 k' data in report

  Scenario: measure search
    When I search for 'TAX DIVISION' from search bar
    Then I should see 'TAX DIVISION' data in report
