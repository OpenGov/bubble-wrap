Feature: Batch Upload - Datasource Screen/Upload size

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test

  @release_run
  Scenario Outline: While uploading, progress of upload is shown in appropriate bytes
    When Upload '<file>' dataset file
    Then I should see uploading progress in size column for '<file>'

    Examples:
      | file                     |
      | gotham_dataset_small.csv |
      | dataset_upl.csv          |
      | dataset_200K.xlsx        |

  Scenario Outline: After uploading size total is shown
    When Upload '<file>' dataset file
    And I see 'Ready' status for '<file>' file in Batch
    Then I should see uploaded '<file>' file size: '<size>'

    Examples:
      | file                     | size  |
      | gotham_dataset_small.csv | 329 B |
      | dataset_upl.csv          | 2 kB  |