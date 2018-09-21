Feature: Delete Dataset and File notification

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
    And 'dataset_upl.csv' dataset should have 'Added' status

  Scenario: File Deleted notification
    When I delete dataset file 'dataset_upl.csv' dataset via trash bin icon
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should see the following message on dataset page:
    """
    File deleted dataset_upl.csv was deleted from the system.
    """

  Scenario: Dataset Deleted notification
    When I delete 'Test' Dataset
    Then I see notification contains 'Test' 'was deleted'
