@tab
Feature: Reports - Documents


  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity

 
  @ORPHAN @fix @ie
  Scenario: Transparency portal documents are displayed

    When I go to the Supporting documents
    And I remember some supporting documents
    And I go to reports from supporting_documents page
    And I select the 'Annual Balance Sheets' report
    Then I should see this documents


  @ORPHAN @frictionless @ie @fix
  Scenario: Documents open in one click in a separate browser window

    When I go to reports from visitor_analytics page
    And I select the 'Annual Balance Sheets' report
    And I click on some document
    Then document should open in a separate browser window

