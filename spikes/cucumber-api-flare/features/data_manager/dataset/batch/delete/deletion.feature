Feature: Batch Upload - Deletion

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file

  @release_run
  Scenario: Delete a parsed upload when only one upload exists
    When I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I delete 'dataset_upl.csv' file from Batch upload
    And I click on Confirmation dialog - 'Okay'
    Then I see 'Deleting' status for 'dataset_upl.csv' file in Batch
    And I see dataset 'File deleted' pop-up status
    And I should see '0 files' on Batch table
    And I should not see 'dataset_upl.csv' file in Batch upload table

  @release_run
  Scenario: Delete a parsed upload when other uploads within uploads table
    When I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I see 'Ready' status for 'dataset_upl_new_code.csv' file in Batch
    And I should see '2 files ready' on Batch table
    And I delete 'dataset_upl.csv' file from Batch upload
    And I click on Confirmation dialog - 'Okay'
    Then I see dataset 'File deleted' pop-up status
    And I see notification contains 'dataset_upl.csv' 'was deleted'
    And I should see '1 file ready' on Batch table
    And I should not see 'dataset_upl.csv' file in Batch upload table

  Scenario: Click to remove but do not confirm deletion from modal
    When I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I delete 'dataset_upl.csv' file from Batch upload
    And I click on Confirmation dialog - 'Cancel'
    Then I should see 'dataset_upl.csv' file in Batch upload table

  @release_run
  Scenario: Delete an upload that has errors
    When I see dataset 'File Uploaded!' pop-up status
    And Upload 'corrupt.xlsx' dataset file
    And I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
    And I close error pop-up
    And I delete 'corrupt.xlsx' file from Batch upload
    And I click on Confirmation dialog - 'Okay'
    Then I see dataset 'File deleted' pop-up status
    And I should not see 'corrupt.xlsx' file in Batch upload table

  Scenario: Attempt to delete upload while uploading
    When I see dataset 'File Uploaded!' pop-up status
    Then I could not delete 'dataset_upl.csv' file while it uploading