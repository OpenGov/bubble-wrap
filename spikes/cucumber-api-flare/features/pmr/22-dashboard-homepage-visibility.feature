@good
Feature: Dashboard homepage visibility

 
  @PMR-37 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: Dashboards with Org visibility are visible on an organization members Dashboard Homepage

    Given I am an entity user
    And there is a dashboard with My Organization Visibility
    When I visit the dashboard gallery
    Then I see the dashboard with My Organization Visibility


  @PMR-37 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: Dashboards shared with a user appear on their Dashboard Homepage

    Given I am an entity user
    And I have been invited to view a private dashboard
    When I visit the dashboard gallery
    Then I see the dashboard I have been invited to


  @PMR-37 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: Private Dashboards not shared with a user do not appear on their Dashboard Homepage

    Given I am an entity user
    And there is a private dashboard not shared with me
    When I visit the dashboard gallery
    Then I do not see the dashboard


  @PMR-37 @assignee:cloeper @version:PMR.18.2.2 @version:PMR.18.3.1 @version:PMR.18.3.2 @version:PMR.18.4.1 @version:Private_Dashboards @COMPLETED
  Scenario: All Dashboards appear on an OpenGov Admin's Dashboard Homepage

    Given I am an OpenGov admin
    And there is a private dashboard not shared with me
    When I visit the dashboard gallery
    Then I see the dashboard

