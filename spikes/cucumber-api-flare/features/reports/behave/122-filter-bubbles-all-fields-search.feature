Feature: Filter bubbles all fields search


  Background:
    Given I am logged as an 'OpenGov Admin' in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report

 
  @REP-997 @assignee:marinha.pereira_at_opengov.com @version:17.10.0.0 @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.10.0.0 @filters @ie
  Scenario: Filter bubble creation for search across entire table from filters

    When I open Filters panel
    And I search for 'Parks' across entire table
    Then I should see filter bubble created with 'Parks'


  @REP-997 @assignee:marinha.pereira_at_opengov.com @version:17.10.0.0 @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.10.0.0 @filters
  Scenario: Filter bubble creation from search bar

    When I search for 'Parks' from search bar
    Then I should see filter bubble created with 'Parks'


  @REP-997 @assignee:marinha.pereira_at_opengov.com @version:17.10.0.0 @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.10.0.0 @filters @fix
  Scenario: Filter bubble deletion for search across entire table from filters

    When I open Filters panel
    And I search for 'Parks' across entire table
    And I clear the filter from filters panel
    Then I should not see the filter bubble with 'Parks'


  @REP-997 @assignee:marinha.pereira_at_opengov.com @version:17.10.0.0 @version:State_Release_1_(W.V._+_A.Z.) @COMPLETED @version:17.10.0.0 @filters
  Scenario: Filter bubble deletion for search from search bar

    When I search for 'Parks' from search bar
    And I close the filter bubble with 'Parks'
    Then I should not see the filter bubble with 'Parks'


  @ORPHAN @filters
  Scenario: Filter bubble creation for search across entire table from filters changes report data

    When I see default report table data
    And I open Filters panel
    And I search for 'Parks' across entire table
    Then I should see filter bubble created with 'Parks'
    And I should see updated data in report


  @ORPHAN @filters
  Scenario: Filter bubble creation from search bar changes report data

    When I see default report table data
    And I search for 'Parks' from search bar
    Then I should see filter bubble created with 'Parks'
    And I should see updated data in report


  @ORPHAN @filters @fix
  Scenario: Filter bubble deletion for search across entire table from filters changes report data to default

    When I see default report table data
    And I open Filters panel
    And I search for 'Parks' across entire table
    And I clear the filter from filters panel
    Then I should not see the filter bubble with 'Parks'
    And Report table data doesn't change


  @ORPHAN @filters
  Scenario: Filter bubble deletion for search from search bar changes report data to default

    When I see default report table data
    And I search for 'Parks' from search bar
    And I close the filter bubble with 'Parks'
    Then I should not see the filter bubble with 'Parks'
    And Report table data doesn't change

