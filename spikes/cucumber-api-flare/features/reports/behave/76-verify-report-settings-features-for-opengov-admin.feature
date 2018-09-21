Feature: Verify report settings features for OpenGov Admin

 
  @ORPHAN @configuration @ie
  Scenario: Entity Admin can see the "Settings" and "Set Default State"

    When I am logged as an 'OpenGov Admin' in 'Gotham' entity
    And I click once on some report
    Then I see 'Settings' button on Report page
    And I see ' Set default state' button on Report page


  @ORPHAN @configuration
  Scenario: Settings panel for Standard report displayed properly for linkage entity

    Given I have a Standard report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I click Settings button
    Then I see setting menu items
      | item1 | General                 |
      | item2 | Link transactional data |
      | item3 | Presentation            |
      | item4 | Report data             |
      | item5 | X-axis configuration    |


  @ORPHAN @configuration
  Scenario: Settings panel for Monthly report displayed properly for linkage entity

    Given I have a Monthly report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I click Settings button
    Then I see setting menu items
      | item1 | Budget monitoring       |
      | item2 | General                 |
      | item3 | Link transactional data |
      | item4 | Monthly report options  |
      | item5 | Presentation            |
      | item6 | Report data             |
      | item7 | X-axis configuration    |


  @ORPHAN @configuration
  Scenario: Settings panel for Balance Sheet report displayed properly for linkage entity

    Given I have a Balance Sheet report in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I click Settings button
    Then I see setting menu items
      | item1 | General                 |
      | item2 | Link transactional data |
      | item3 | Presentation            |
      | item4 | Report data             |
      | item5 | X-axis configuration    |


  @ORPHAN @configuration @ie
  Scenario: Settings panel for Grid-based report displayed properly for linkage entity

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I visit the report
    And I click Settings button
    Then I see setting menu items
      | item1 | General     |
      | item2 | Report data |

