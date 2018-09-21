@testing_env
Feature: Settings - Entity Fiscal Start Date

  Scenario: User can not edit Entity Fiscal Start Date after dataset upload
    Given I am logged on as an OpenGov admin
    And I am in a new entity
    When I go to settings from visitor_analytics page
    And I open 'General' settings tab
    And I edit fiscal year start date and confirm the new date - June 17
    And I go to data manager from settings_app page
    And I upload a General Ledger as a dataset
    And I map the General Ledger columns
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I click on 'Edit General Info' button
    Then 'Entity Fiscal Start Date' field edit should be unavailable