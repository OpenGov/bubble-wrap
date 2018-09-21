Feature: Georeference (Maps) Disabled

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.xlsx' dataset file
    And I click 'Continue' Mapping button

  Scenario: Maps pro and light disabled will not show georeference step
    Then There is no 'Geocoding (Optional)' step

  @release_run
  Scenario: Without georeference step in second step action button displays Save
    When I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    Then I see 'Setup & Add' Mapping button
