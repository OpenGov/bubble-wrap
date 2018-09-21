Feature: Batch row counter

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test

  Scenario: Correct row counter for upload single file
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    Then I should see '19 rows' value for 'dataset_upl.csv' dataset
    And I should see total rows number: '19 rows'

  Scenario: Correct row counter for upload multiple files
    When Upload 'dataset_25K.xlsx' dataset file
    And I see 'Ready' status for 'dataset_25K.xlsx' file in Batch
    And Upload 'dataset_1K.xlsx' dataset file
    And I see 'Ready' status for 'dataset_1K.xlsx' file in Batch
    And Upload 'dataset_all_new_code.xlsx' dataset file
    And I see 'Ready' status for 'dataset_all_new_code.xlsx' file in Batch
    Then I should see '10 rows' value for 'dataset_all_new_code.xlsx' dataset
    And I should see '1,000 rows' value for 'dataset_1K.xlsx' dataset
    And I should see '25,000 rows' value for 'dataset_25K.xlsx' dataset
    And I should see total rows number: '26,010 rows'