Feature: Create Not Linked Dataset

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api

  Scenario: Create a CoA not linked Dataset
    When I click New Dataset
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    Then I see that New Dataset is appear in Dataset list

  Scenario: Can create multiple not linked Datasets
    When I create 4 non-linked datasets with 'dataset_upl.csv' file and no mapping
    Then I see that Test1 is appear in Dataset list
    And I see that Test2 is appear in Dataset list
    And I see that Test3 is appear in Dataset list
    And I see that Test4 is appear in Dataset list