Feature: Dataset Cloning - GeoMaps Disabled

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I click on Create Copy button

  Scenario: Continue blocked if no name added
    When I change 'Test [Copy]' dataset copy name to ''
    Then 'Continue' Mapping button is disable

  Scenario: Continue unblocked when name present
    When I change 'Test [Copy]' dataset copy name to ''
    And I change '' dataset copy name to 'New Test Copy Name'
    Then 'Continue' Mapping button is enable

  Scenario: Continue blocked if mapping removed
    When I click 'Continue' Mapping button
    And I remove mapping for the following columns
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
    Then 'Continue' Mapping button is disable

  Scenario: Create Copy blocked if type removed
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I remove mapping for the following columns
      | Amount | Currency |
    Then 'Create Copy' Mapping button is disable

  Scenario: Continue and Back work correctly for name
    When I change 'Test [Copy]' dataset copy name to 'New Test Copy Name'
    And I click 'Continue' Mapping button
    And I click 'Back' Mapping button
    Then I should see dataset copy name: 'New Test Copy Name'

  Scenario: Continue and Back work correctly for mappings
    When I click 'Continue' Mapping button
    And I remove mapping for the following columns
      | Financial Year   | Fiscal Year            |
    And I map required fields for dataset file
      | Amount           | Fiscal Year            |
    And I click 'Back' Mapping button
    And I create a timeout 0.5 seconds
    And I click 'Continue' Mapping button
    Then I should see filled the following mapping fields
      | Amount           | Fiscal Year            |
    And I should see blank the following mapping fields
      | Financial Year   |

  Scenario: Continue and Back work correctly for types
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Back' Mapping button
    And I click 'Back' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    Then I should see filled the following mapping fields
      | Amount | Number |

  Scenario: Ensure cancel works
    When I click 'Continue' Mapping button
    And I click 'Cancel' Mapping button
    Then I should see confirmation dialog

  Scenario: Ensure correct uploads show for clone
    Then I should see the following files used by the copy
      | dataset_upl.csv |

  Scenario: Notifications check
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    Then I see dataset 'Copying started.' pop-up status
    And I see dataset 'Dataset Copy Created.' pop-up status
    And I see dataset 'Dataset Copied' pop-up status

  Scenario: Dataset Copy check - Source file tab
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copied' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I go to Configure Test Dataset
    And I select Configure columns on Dataset configure option
    Then I should see the correct Column name and Display name
      | Fiscal Year            | Fiscal Year            |
      | Fiscal Period          | Fiscal Period          |
      | Fund Description       | Fund Description       |
      | Fund Code              | Fund Code              |
      | Department Description | Department Description |
      | Department Code        | Department Code        |
      | Object Description     | Object Description     |
      | Object Code            | Object Code            |
      | Amount                 | Amount                 |

  Scenario: Mapping update check
    When I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copied' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I go to Configure Test [Copy] Dataset
    And I go to Dataset Details
    Then I see that mappings are correct
      | Fiscal Year   | Financial Year     | Number   |
      | Amount        | Transaction Amount | Currency |

  Scenario: Amount Type Update Check
    When I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Number                |
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copied' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I go to Configure Test [Copy] Dataset
    And I go to Dataset Details
    Then I see that mappings are correct
      | Fiscal Year   | Financial Year     | Number |
      | Fiscal Period | Financial Period   | Number |
      | Amount        | Transaction Amount | Number |