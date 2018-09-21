Feature: Dataset Cloning - GeoMaps Enabled

  Background:
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
    And I see dataset 'File processed' pop-up status
    And I click on Create Copy button

  Scenario: Continue blocked if geo mappings partially present
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I remove geo mapping for the following columns
      | Address | Full_address |
      | City    | City         |
    Then 'Create Copy' Mapping button is disable

  Scenario: Continue enabled if geo mappings present
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    Then 'Create Copy' Mapping button is enable

  Scenario: Continue and Back work correctly for geomappings
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I remove geo mapping for the following columns
      | Address | Full_address |
      | City    | City         |
    And I click 'Back' Mapping button
    And I click 'Back' Mapping button
    And I click 'Back' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    Then I should see blank the following geo mapping fields
      | Address |
      | City    |

  @bug #DTOOLS-1050
#  Scenario: Geomap Update Check
#    When I click 'Continue' Mapping button
#    And I click 'Continue' Mapping button
#    And I click 'Continue' Mapping button
#    And I click geo map 'Coordinates' button
#    And I geo map required fields for dataset file
#      | Longitude | Longitude |
#      | Latitude  | Latitude  |
#    And I click 'Create Copy' Mapping button
#    And I see dataset 'Dataset Copied' pop-up status
#    And I select 'Test [Copy]' dataset
#    And 'dataset_upl_geo_map.xlsx' dataset should have 'Added' status
#    And I go to Configure Test [Copy] Dataset
#    And I go to Dataset Details
#    Then I see that mappings are correct
#      | Longitude | Longitude | Longitude |
#      | Latitude  | Latitude  | Latitude  |

  Scenario: Geomap Update Check - Invalid Mapping
    When I click 'Continue' Mapping button
    And I remove mapping for the following columns
      | Financial Year   | Fiscal Year  |
      | Amount           | Amount       |
    And I map required fields for dataset file
      | Amount           | Fiscal Year  |
      | Financial Year   | Amount       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Fiscal Year      | Currency     |
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created.' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl_geo_map.xlsx' dataset should have 'Error Processing' status

  Scenario: Geomap Update Check - Invalid Type
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Fund Description | Number  |
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created.' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl_geo_map.xlsx' dataset should have 'Error Processing' status

  Scenario: Geomap Update Check - Invalid GeoMapping
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I geo map required fields for dataset file
      | Address | Longitude       |
      | City    | Department Code |
      | State   | Amount          |
      | Zipcode | Fiscal Year     |
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created.' pop-up status
    And I select 'Test [Copy]' dataset
    Then 'dataset_upl_geo_map.xlsx' dataset should have 'Error Processing' status