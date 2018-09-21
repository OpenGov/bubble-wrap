Feature: Edit CoA - Column Dropdown
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @bvt @phantom @release_run
  Scenario: User can save altered CoA
    When I go to 'FTE Counts' tab
    And I add new level
    And I save changes
    Then I should see the following message on data_manager page:
      """
      Updated CoA Your CoA has been successfully updated!
      """

  @bvt @phantom
  Scenario: User can add new column on left
    When I go to 'Uncategorized' tab
    And I add new level
    Then I should see 'New Level' column name
    And I should see 'New item' column element

  @bug @ES-3122
  Scenario: User can delete a column
    When I go to 'Funds' tab
    And I add new level for 'Fund Type' column
    And I rename 'New Level' column to 'Fund Test Level'
    And I delete 'Fund Test Level' column
    Then I shouldn't see 'Fund Test Level' column name

  @bvt @phantom
  Scenario: As an admin I cannot delete the root summary level on a ledger tree
    When I go to 'Funds' tab
    And I click on 'Funds' dropdown menu
    Then I should not be able to delete the 'Funds' level on a ledger tree

  @bvt @phantom
  Scenario: As an admin I am able to delete any non root level on a ledger tree
    When I go to 'Assets' tab
    And I click on 'Object Type' dropdown menu
    Then I should be able to delete the 'Object Type' level on a ledger tree

  @p1
  Scenario: Grouping by name new codes
    When I go to 'Departments' tab
    And I add new 5 'Test_348' items with '09' codes to the Division column
    And I group duplicates on 'Division' column
    Then I should see 'Test_348' group

  @p1
  Scenario: Ungrouping all codes
    When I go to 'Departments' tab
    And I add new 5 'Test_348' items with '09' codes to the Division column
    And I group duplicates on 'Division' column
    And I ungroup all codes on 'Division' column
    Then I shouldn't see any group

  @p2 @phantom
  Scenario: Verify ascending sorting
    When I go to 'Expenses' tab
    And I sort 'Object Type' column by ascending
    Then I should see 'Ascending sort successful' pop-up
    And I should see 'Object Type' elements sorted by ascending

  @p2 @phantom
  Scenario: Verify descending sorting
    When I go to 'Revenues' tab
    And I sort 'Object Type' column by descending
    Then I should see 'Descending sort successful' pop-up
    And I should see 'Object Type' elements sorted by descending


