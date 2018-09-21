@release_run
Feature: Edit CoA - Sorting
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a new entity
    When I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to data manager from DataManager page
    And I click edit CoA

  Scenario: Verify ascending sorting
    When I go to 'Expenses' tab
    And I sort 'Object Type' column by ascending
    Then I should see 'Ascending sort successful' pop-up
    And I should see 'Object Type' elements sorted by ascending
    
  Scenario: Verify descending sorting
    When I go to 'Revenues' tab
    And I sort 'Object Type' column by descending
    Then I should see 'Descending sort successful' pop-up
    And I should see 'Object Type' elements sorted by descending