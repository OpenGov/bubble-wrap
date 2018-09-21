@testing_env
Feature: Add feature flag: Legacy CoA

  Scenario: User can see and follow the legacy link in the new CoA Manager
    Given I am logged on as an OpenGov admin
    And I am in a 'Gotham' entity
    When I go to settings from visitor_analytics page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | legacy_coa |
    And I go to data manager from settings_app page
    And I click edit CoA
    And I click on link 'Go to Legacy Editor'
    Then I should be on 'GLEditor' page

  Scenario: OG admin can see and follow the legacy link in the new CoA Manager
    Given I am logged on as an OpenGov admin
    And I am in a 'Gotham' entity
    When I go to settings from visitor_analytics page
    And I open 'General' settings tab
    And I disable the following feature flags
      | item1 | legacy_coa |
    And I go to data manager from settings_app page
    And I click edit CoA
    And I click on link 'Go to Legacy Editor'
    Then I should be on 'GLEditor' page

  @bug
  Scenario: User can go to Legacy Editor
    Given I am logged as an entity admin
    When I go to data manager from reports page
    And I click edit CoA
    And I click on link 'Go to Legacy Editor'
    Then I should be on 'GLEditor' page

  Scenario: Any existing customers will be default to not have access to the legacy CoA link
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    When I go to settings from visitor_analytics page
    And I open 'General' settings tab
    Then I should see 'legacy_coa' feature with false value