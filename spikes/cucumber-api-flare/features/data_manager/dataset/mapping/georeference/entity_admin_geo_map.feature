Feature: Geo Mapping for Entity Admin

  Scenario: Entity Admin create limit Map Geo with default settings
    Given I am logged into prescottvalleyaz as an entity_admin
    When I go to data manager from reports page
    And I click New Dataset
    And I create a New Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Fiscal Year |
      | Amount      | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount      | Currency    |
    And I click 'Continue' Mapping button
    Then There is georeference mappings buttons
      | Coordinates |
    And There is no georeference mappings buttons
      | Street addresses |

  Scenario: Entity Admin create Map Geo with enable Map Pro settings
    Given I am logged on as an OpenGov admin
    And Create an Entity and Entity Admin by api
    When I go to settings from visitor_analytics page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_pro       |
      | item2 | create_dataset |
    And I logged out from settings_app page
    And I am logged in current entity as an Entity Admin
    And I go to data manager from reports page
    And I click New Dataset
    And I create a New Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Fiscal Year |
      | Amount      | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount      | Currency    |
    And I click 'Continue' Mapping button
    Then There is georeference mappings buttons
      | Coordinates      |
      | Street addresses |
