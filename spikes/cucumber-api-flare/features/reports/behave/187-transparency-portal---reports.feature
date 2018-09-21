@portal
Feature: Transparency Portal - Reports


  Background:
    Given I am logged into metropolis as an entity_admin
    And I go to portal from reports page
    And I go to Reports portal section

 
  @ORPHAN
  Scenario: Add reports to the portal

    When I add some report
    Then I should see this report in the list


  @ORPHAN
  Scenario: Remove reports

    When I add some report
    And I delete this report
    Then I shouldn't see this report in the list


  @ORPHAN @fix
  Scenario: Preview reports

    When I click on Preview in Transparency button
    And I skip transparency report welcome tour
    Then I should see preview report container


  @ORPHAN
  Scenario: Make changes to reports

    When I add some report
    And I click on View Edit button on some report
    Then I should be able to make changes to this reports


  @ORPHAN @fix
  Scenario: Reorder the reports on the page

    When I reorder the reports on the page
    Then I should see new order of reports

