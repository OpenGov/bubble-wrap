Feature: Georeference (Maps) Enabled

  Scenario: Maps light enabled will display georeference step
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.xlsx' dataset file
    And I click 'Continue' Mapping button
    Then There is a 'Geocoding (Optional)' step

  Scenario: Maps pro enabled will display georeference step
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_pro |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.xlsx' dataset file
    And I click 'Continue' Mapping button
    Then There is a 'Geocoding (Optional)' step

  Scenario: Maps pro or light and location mapping
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
      | item2 | maps_pro   |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    And I click geo map 'Coordinates' button
    And I geo map required fields for dataset file
      | Longitude | Longitude |
      | Latitude  | Latitude  |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added

  Scenario: Maps pro or light and address mapping
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
      | item2 | maps_pro   |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    And I click geo map 'Street addresses' button
    And I geo map required fields for dataset file
      | Address | Full_address |
      | City    | City         |
      | State   | State        |
      | Zipcode | Zip_code     |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added

  Scenario: Maps light when a role other than 'opengov_admin', 'opengov_tsd', 'opengov_engineer', 'entity_group_partner'
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I create a New Dataset with a random name
    And Upload 'dataset_upl.xlsx' dataset file
    And I see 'Ready' status for 'dataset_upl.xlsx' file in Batch
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
    And I disable the following feature flags
      | item1 | maps_pro |
    And I logged out from settings_app page
    And I am logged into ankenyia as an entity_admin
    When I go to data manager from reports page
    And I go to newly created Dataset
    And I click 'Set up Data'
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    Then There is no georeference mappings buttons
      | Street addresses |

  Scenario: Incomplete Coordinates georeference mappings blocks Save
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
      | item2 | maps_pro   |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    And I click geo map 'Coordinates' button
    And I geo map required fields for dataset file
      | Longitude | Longitude |
    And 'Setup & Add' Mapping button is disable
    And I geo map required fields for dataset file
      | Latitude | Latitude |
    Then 'Setup & Add' Mapping button is enable

  Scenario: Incomplete Street Address georeference mappings blocks Setup & Add
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
      | item2 | maps_pro   |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    And I click geo map 'Street addresses' button
    And I geo map required fields for dataset file
      | Address | Full_address |
    And 'Setup & Add' Mapping button is disable
    And I geo map required fields for dataset file
      | City    | City         |
      | State   | State        |
      | Zipcode | Zip_code     |
    Then 'Setup & Add' Mapping button is enable

  Scenario: Invalid GeoMapping should block saving (turn red) and error notification present
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | maps_light |
      | item2 | maps_pro   |
    And I go to data manager from settings_app page
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl_geo_map.xlsx' dataset file
    And I click 'Continue' Mapping button
    And There is a 'Geocoding (Optional)' step
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Continue' Mapping button
    And I click geo map 'Coordinates' button
    And I geo map required fields for dataset file
      | Longitude | Longitude |
      | Latitude  | Amount    |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'Setup Failed!' pop-up status
