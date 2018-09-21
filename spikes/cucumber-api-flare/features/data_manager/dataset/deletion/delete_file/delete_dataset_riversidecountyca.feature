@wip # redshift entity
Feature: Delete file from dataset for Riverside County

  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'riversidecountyca' entity
    And I go to data manager from visitor_analytics page
    And I open Actuals 12.5.17 (redshift) Dataset
    And I click Upload File button
    And Upload 'Rivco_2016_P4_Test.csv' dataset file
    And I click 'Add to Dataset' Mapping button
    And 'Rivco_2016_P4_Test.csv' dataset should have 'Error Processing' status

  @wip
  Scenario: Delete file from Property panel
    When I click on 'Rivco_2016_P4_Test.csv' source file
    And I click Delete dataset file via property panel
    Then 'Rivco_2016_P4_Test.csv' dataset should have 'Deleting' status
    And I should not see 'Rivco_2016_P4_Test.csv' dataset in a source files list

  @wip
  Scenario: Delete file via trash icon
    When I delete dataset file 'Rivco_2016_P4_Test.csv' dataset via trash bin icon
    Then 'Rivco_2016_P4_Test.csv' dataset should have 'Deleting' status
    And I should not see 'Rivco_2016_P4_Test.csv' dataset in a source files list
