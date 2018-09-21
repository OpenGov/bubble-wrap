@filters @wip @ie
Feature: Fiscal Year Through drop-down list for Grid Report

 
  @ES-3662 @assignee:chad.miller_at_opengov.com @ORPHAN
  Scenario: Months show in drop down

    Given I am logged into Sausalitoca as an entity_admin
    When I select the 'Budget-to-Actual' report
    And I select the 'Fiscal Year Through' dropdown
    Then I should see a list of the months of the year


  @ES-3662 @assignee:chad.miller_at_opengov.com @ORPHAN
  Scenario: Visualization updates when month is selected

    Given I am logged into Sausalitoca as an entity_admin
    When I select the 'Budget-to-Actual' report
    And I select the 'Fiscal Year Through' dropdown
    And I select a month from the dropdown
    Then the graph and legend should update

