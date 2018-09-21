@newreport @serial @wip @creation
Feature: Entity Partner can create a report

 
  @ORPHAN @ie
  Scenario: New Standard report

    Given I am logged on as an Entity partner
    And I go to portal from reports page
    And I am in a 'Jared Test' entity
    And I go to reports from visitor_analytics page
    And I begin to create a 'Standard' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose current year for report
    And I fill in the report information
    And I create the report
    Then I see that report is created successfully


  @ORPHAN @ie
  Scenario: New Monthly report

    Given I am logged on as an Entity partner
    And I go to portal from reports page
    And I am in a 'Jared Test' entity
    And I go to reports from visitor_analytics page
    And I begin to create a 'Monthly' report
    And I select specific ledger types
      | type1 | Revenues |
      | type2 | Expenses |
    And I choose current year for report
    And I fill in the report information
    And I create the report
    Then I see that report is created successfully

