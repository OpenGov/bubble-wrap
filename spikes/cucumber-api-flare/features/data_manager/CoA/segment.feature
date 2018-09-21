Feature: Change CoA segment order

  @wip # need to added verification step
  Scenario: Admin can change Segment order
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | segment_ordering_engineering_only |
    And I go to data manager from settings_app page
    When I upload a 'CoA_Cerritos_v0.csv' CoA file
    And I complete a map for CoA columns
    And I click 'Change Segment Order' button
    And I drag 'Funds' segment and drop to 'Account Types' position
    And I click Save Changes button