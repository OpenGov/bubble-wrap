Feature: Show more button

 
  @REP-1472 @assignee:whuang @version:18.5.1 @COMPLETED @grid_report @ie
  Scenario: Click Show More button updates the graph and legend

    Given I am logged into Tobolsk as an entity_admin
    When I select the '1K+5 Rows Report' report
    And I see default chart and legend report data
    And I navigate to legend and scroll down to Show More button
    And I click Show More button
    Then the graph and legend should update


  @REP-1472 @assignee:whuang @version:18.5.1 @COMPLETED @grid_report @fix
  Scenario: Click Show More button updates the graph and legend for monthly view

    Given I am logged into sausalitoca as an entity_admin
    When I select the 'Transactions' report
    And I go to '2015-16' monthly view
    And I see default chart and legend report data
    And I navigate to legend and scroll down to Show More button
    And I click Show More button
    Then the graph and legend should update

