Feature: Chart of Accounts Home Page

  @p2
  Scenario: can rename CoA
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I edit 'Chart of Accounts - ' CoA to 'Test coa name edit'
    Then I should see CoA name: 'Test coa name edit'
    And I should see the following message on data_manager page:
      """
      Updated CoA Your CoA has been successfully updated!
      """

  @p2
  Scenario: cannot rename CoA to blank
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I edit 'Chart of Accounts - ' CoA to ''
    Then I should see the following error message:
      """
      Failed to update CoA
      """

  @bvt
  Scenario: see CoA card
    Given I am logged on as an OpenGov admin
    And I am in a 'Gotham' entity
    When I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    Then I should see CoA card

  @bvt @release_run
  Scenario: view CoA details
    Given I am logged on as an OpenGov admin
    And I am in a 'Gotham' entity
    When I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA
    Then I should see CoA details