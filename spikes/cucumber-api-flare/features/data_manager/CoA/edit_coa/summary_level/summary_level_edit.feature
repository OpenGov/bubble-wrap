Feature: Add a new node for new CoA column

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA

  Scenario: Admin can create new parent nodes
    When I go to 'Funds' tab
    And I add new level
    And I rename 'New Level' column to 'Fund Test Level'
    And I add new 'Fund Test Node' item to the column
    And I save changes
    Then I should see 'Fund Test Node' column element

  Scenario: Admin cannot delete the root summary level on a ledger tree
    When I go to 'Funds' tab
    And I click on 'Funds' dropdown menu
    Then I should not be able to delete the 'Funds' level on a ledger tree

  Scenario: Admin can delete any non root level on a ledger tree
    When I go to 'Assets' tab
    And I click on 'Object Type' dropdown menu
    Then I should be able to delete the 'Object Type' level on a ledger tree