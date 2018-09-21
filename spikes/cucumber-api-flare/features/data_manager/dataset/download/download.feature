Feature: Export/Download Dataset file

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    When Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status

  Scenario: User can download uploaded file from Property panel
    When I open a Dataset property panel
    And I click Download dataset file via property panel
    Then Download complete successfully

  Scenario: User can download uploaded file from Download Icon on source file
    When I download dataset file 'dataset_upl.csv' via source icon
    Then Download complete successfully