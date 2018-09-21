@graphs @grid_report
Feature: Data Visualization


  Background:
    Given I am logged into sausalitoca as an entity_admin
    And I select the 'Transactions' report
    And I see default list of legend items

 
  @REP-1199 @assignee:asimsek @version:18.3.2 @COMPLETED @v1 @ie
  Scenario: Filter by category 

    When I click 'Police' legend item
    Then I should see a bar graphs
    And I should see updated list of legend items


  @REP-1199 @assignee:asimsek @version:18.3.2 @COMPLETED @v1 @ie @fix
  Scenario: Filter by broken down by

    When I select 'Fund' option on Broken Down By filter
    Then I should see a bar graphs
    And I should see updated list of legend items

