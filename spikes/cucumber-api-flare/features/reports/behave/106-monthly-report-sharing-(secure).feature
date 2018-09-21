@sharing
Feature: Monthly report sharing (secure)


  Background:
    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN @ie
  Scenario: Can read a shared report with report reader access

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Can view' access
    And I logged out from report_view page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the 'Monthly_u' report
    Then I shouldn't see share button


  @ORPHAN
  Scenario: Can read a shared report with report admin access

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Can edit' access
    And I logged out from report_view page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the 'Monthly_u' report
    Then I should see share button


  @ORPHAN
  Scenario: Can update a shared report with report admin access

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Can edit' access
    And I logged out from report_view page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the 'Monthly_u' report
    Then I should be able to update this report


  @ORPHAN
  Scenario: Cannot update a report that has not been shared as admin access

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Can view' access
    And I logged out from report_view page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the 'Monthly_u' report
    Then I shouldn't be able to update this report

