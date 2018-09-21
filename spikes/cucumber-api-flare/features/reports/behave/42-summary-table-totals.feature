@bug @grid_report @table
Feature: Summary Table Totals


  Background:
    Given I am logged into alphatestal as an entity_user

 
  @REP-1277 @COMPLETED @ie
  Scenario: Non-Zero Category Values Are Not Displayed As Zero - Yearly Dataset

    When I select the 'Grid multi-category' report
    And I select the '20a' category row in the summary table
    And I toggle 'Summary' tab from report
    Then the unfiltered '20a' category values equal the displayed values


  @REP-1277 @COMPLETED
  Scenario: Non-Zero Category Values Are Not Displayed As Zero - Monthly Dataset

    When I select the 'Grid multi-category monthly' report
    And I select the '2279a' category row in the summary table
    And I toggle 'Summary' tab from report
    Then the unfiltered '2279a' category values equal the displayed values

