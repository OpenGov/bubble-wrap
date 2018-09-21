Feature: Batch Upload - Datasource Screen/Datasource name

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test

  Scenario: Default datasource name is initial filename without extension
    When Upload 'dataset_upl.csv' dataset file
    Then I should see batch name: 'dataset_upl'

  @release_run
  Scenario: Update datasource name
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I change 'dataset_upl' batch name to 'New Batch Name'
    Then the green icon should appear next to batch name input
    And I should see batch name: 'New Batch Name'

  Scenario: Update datasource name - reload check
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I change 'dataset_upl' batch name to 'New Batch Name'
    And the green icon should appear next to batch name input
    And I reload a DatasetMapping page
    Then I should see batch name: 'New Batch Name'