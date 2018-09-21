Feature: Edit CoA - Save button

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA

  @release_run
  Scenario: User can save altered CoA - Recategorization
    When I go to 'Funds' tab
    And I click recategorize 'CCPA Endowment Fund' element via right click menu
    And I select parent 'Enterprise funds' category and '' type
    And I save changes
    Then I should see the following message on data_manager page:
      """
      Updated CoA Your CoA has been successfully updated!
      """

  @bvt @release_run
  Scenario: User can save altered CoA - Add new item
    When I go to 'FTE Counts' tab
    And I add new 'Test Item' item to the column
    And I save changes
    Then I should see the following message on data_manager page:
      """
      Updated CoA Your CoA has been successfully updated!
      """

  Scenario: User can see update Notification window (Changes list)
    When I go to 'FTE Counts' tab
    And I add new 'Test Item' item to the column
    And I go to 'Funds' tab
    And I click recategorize 'CCPA Endowment Fund' element via right click menu
    And I select parent 'Enterprise funds' category and '' type
    And I click save button
    Then I should see the following confirmation modal text
      """
      You have made 2 edits including changes to nodes. Note: Changing account types can not be undone.
      """

  Scenario: User can quit coa modal change
    When I go to 'FTE Counts' tab
    And I add new 'Test Item' item to the column
    And I click save button
    Then I should be able to quit modal

  Scenario: User can cancel coa modal change
    When I go to 'FTE Counts' tab
    And I add new 'Test Item' item to the column
    And I click save button
    Then I should be able to cancel modal