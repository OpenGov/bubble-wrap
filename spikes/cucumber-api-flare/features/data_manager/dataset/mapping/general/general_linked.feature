Feature: Dataset Mapping - General

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period

  Scenario: Ensure 'Continue' returns to disabled state on column mapping removal (Step 1)
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I remove mapping for the following columns
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    Then 'Continue' Mapping button is disable

  Scenario: Ensure already mapped column names do not re-appear once already selected (Step 1)
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
    And I open dropdown for 'Departments' field
    Then I should not see the following mapping item in dropdown
      | item 1 | Fiscal Year     |
      | item 2 | Fiscal Period   |
      | item 3 | Amount          |

  Scenario: Hovering over a column selection in field dropdown list (Step 1) highlights it in the preview table.
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
    And I open dropdown for 'Departments' field
    And I hover 'Object Code' dropdown mapping option
    Then I should see 'Object Code' column highlighted

  Scenario: Selecting a column in Step 1 marks the column in preview table with name.
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
    Then I should see 'Fiscal Year' column has been mapped

  Scenario: Ensure 'Cancel' button takes use back to Source Files list
    When I click 'Cancel' Mapping button
    And I click 'Okay' in dialog on Mapping Page
    Then I should be on 'data_manager' page

  Scenario: Ensure Back in browser and then return to Mapping has saved it.
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I click 'Back' Mapping button
    And I go Back in browser
    And I go Back in browser
    And I go Back in browser
    And I click 'Continue' Mapping button
    Then I should see filled the following mapping fields
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    
  Scenario: Back button saves previous step work.
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I click 'Back' Mapping button
    Then I should see filled the following mapping fields
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |

  Scenario: Back button followed by mapping invalidate causes Continue to be disabled
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I click 'Back' Mapping button
    And I remove mapping for the following columns
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And 'Continue' Mapping button is disable
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    Then 'Continue' Mapping button is enable

  Scenario: Removing a type being selected will still cause disabled Add to Dataset
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I remove mapping for the following columns
      | Amount           | Currency      |
    Then 'Setup & Add' Mapping button is disable