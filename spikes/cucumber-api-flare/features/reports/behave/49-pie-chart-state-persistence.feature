@graphs @grid_report
Feature: Pie Chart State Persistence

 
  @REP-1296 @assignee:ljoshi @version:18.4.1 @COMPLETED @ie
  Scenario: Default Graph View Persists

    Given I am logged into alphatestal as an entity_admin
    And I create 'Grid-based' report with 'Cerritos Linked' dataset
    When I click on bar graph
    And I click on pie graph
    And I refresh report page
    Then I should see a pie graphs

