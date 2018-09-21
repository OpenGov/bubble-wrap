Feature: Report Updated date

  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    When I go to reports from visitor_analytics page
    And I select 'CoA_Cerritos_v0' coa for report

  Scenario: Report card updated properly
    When I get 'REPORT_TEST' report updated date in card
    And I go to data manager from reports page
    And I select 'DATASET' dataset
    And I click Upload File button
    And Upload 'dataset_1K.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    And 'dataset_1K.xlsx' dataset should have 'Added' status
    And I go to reports from data_manager page
    And I select 'CoA_Cerritos_v0' coa for report
    Then I check that 'REPORT_TEST' report updated date in card was change

  Scenario: Report list updated properly
    When I open list view
    And I get 'REPORT_TEST' report updated date in list
    And I go to data manager from reports page
    And I select 'DATASET' dataset
    And I click Upload File button
    And Upload 'dataset_1K.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    And 'dataset_1K.xlsx' dataset should have 'Added' status
    And I go to reports from data_manager page
    And I select 'CoA_Cerritos_v0' coa for report
    And I open list view
    Then I check that 'REPORT_TEST' report updated date in list was change

  Scenario: Report updated properly
    When I select the 'REPORT_TEST' report
    And I get report updated date
    And I go to data manager from report_view page
    And I select 'DATASET' dataset
    And I click Upload File button
    And Upload 'dataset_1K.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    And 'dataset_1K.xlsx' dataset should have 'Added' status
    And I go to reports from data_manager page
    And I select 'CoA_Cerritos_v0' coa for report
    And I select the 'REPORT_TEST' report
    Then I check that report updated date was change