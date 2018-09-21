Feature: Edit CoA - Grouping

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA

  @release_run
  Scenario: Grouping by name new codes
    When I go to 'Departments' tab
    And I add new 5 'Test_348' items with '09' codes to the Departments column
    And I group duplicates on 'Departments' column
    Then I should see 'Auto-Grouping Successful' pop-up
    And I should see pop-up text '10 group(s)'
    And I should see 'Test_348' group

  Scenario: Add new group to existing grouping column
    When I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I add new 5 'Test_348' items with '09' codes to the Departments column
    And I group duplicates on 'Departments' column
    Then I should see 'Auto-Grouping Successful' pop-up
    And I should see pop-up text '1 group(s)'
    And I should see 'Test_348' group

  @release_run
  Scenario: Group existing group
    When I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I should see 'Auto-Grouping Successful' pop-up
    And I group duplicates on 'Departments' column
    Then I should see 'No Duplicates Found' pop-up

  Scenario: Ungrouping all codes
    When I go to 'Departments' tab
    And I group duplicates on 'Departments' column
    And I should see 'Auto-Grouping Successful' pop-up
    And I ungroup all codes on 'Departments' column
    And I should see 'All Groups Removed' pop-up
    Then I shouldn't see any group

  Scenario: Ungroup non-grouping elements
    When I go to 'Departments' tab
    And I ungroup all codes on 'Departments' column
    Then I should see 'No Groups Found' pop-up

  @release_run
  Scenario: Grouping different parents elements
    When I go to 'Revenues' tab
    And I click on 'Taxes' column item
    And I add new 1 'Test_348' items with '09' codes to the Object column
    And I click on 'Franchises' column item
    And I add new 1 'Test_348' items with '009' codes to the Object column
    And I group duplicates on 'Object' column
    Then I shouldn't see 'Test_348' group in 'Object' column

  Scenario: Admin can group multiple CoA codes
    When I go to 'Funds' tab
    And I group multiple elements via right click menu
      | item1  | Street Improvement Fund       |
      | item2  | Drainage Fund                 |
      | item3  | SB 821 Fund                   |
      | item4  | Aqmd Fund                     |
      | item5  | Measure "R" Fund              |
      | item6  | Proposition "A" Fund          |
      | item7  | Proposition "C" Fund          |
      | item8  | Assessment District # 6 Fund  |
      | item9  | Los Coyotes Lighting District |
      | item10 | Ca State Library Fund         |
    And I save changes
    Then I should see 'Street Improvement Fund' column element
    And I shouldn't see 'Drainage Fund' column element
    And I shouldn't see 'SB 821 Fund' column element
    And I shouldn't see 'Aqmd Fund' column element
    And I shouldn't see 'Measure "R" Fund' column element
    And I shouldn't see 'Proposition "A" Fund' column element
    And I shouldn't see 'Proposition "C" Fund' column element
    And I shouldn't see 'PAssessment District # 6 Fund' column element
    And I shouldn't see 'Los Coyotes Lighting District' column element
    And I shouldn't see 'Ca State Library Fund' column element

  Scenario: Admin can expand group to reveal members
    When I go to 'Funds' tab
    And I group multiple elements via right click menu
      | item1  | Street Improvement Fund       |
      | item2  | Drainage Fund                 |
      | item3  | SB 821 Fund                   |
      | item4  | Aqmd Fund                     |
      | item5  | Measure "R" Fund              |
      | item6  | Proposition "A" Fund          |
    And I expand just created group
    Then I should see the following group items
      | List                          |
      | Proposition "A" Fund          |
      | Measure "R" Fund              |
      | Aqmd Fund                     |
      | SB 821 Fund                   |
      | Drainage Fund                 |
      | Street Improvement Fund       |

  Scenario: Admin can drag members from one group to another group
    When I go to 'Revenues' tab
    And I group multiple elements via right click menu
      | item1 | Ad Valorem Tax                 |
      | item2 | Admission Tax                  |
      | item3 | Business License               |
      | item4 | Business License-Tobacco Retai |
    And I expand just created group
    And I click on 'Documentary Transfer Taxes' column item
    And I group multiple elements via right click menu
      | item1 | Abx1 26 Ptr Residual    |
      | item2 | Transient Occupancy Tax |
      | item3 | Cigarette Taxes         |
    And I expand 'Documentary Transfer Taxes' group
    And I click on 'Business License-Tobacco Retai' column item
    And I drag 'Business License-Tobacco Retai' item and drop to 'Transient Occupancy Tax' position
    And I click on 'Franchise - Trash' column item
    Then I should see the following group items
      | List                           |
      | Business License-Tobacco Retai |
      | Cigarette Taxes                |
      | Transient Occupancy Tax        |
      | Abx1 26 Ptr Residual           |
      | Documentary Transfer Taxes     |

  Scenario: Admin can drag nodes into the group
    When I go to 'Expenses' tab
    And I group multiple elements via right click menu
      | item1  | Regular Earnings     |
      | item2  | Floating Holiday Pay |
      | item3  | Vacation             |
      | item4  | Jury Duty            |
      | item5  | Overtime             |
    And I expand just created group
    And I click on 'Holiday Pay' column item
    And I drag 'Holiday Pay' item and drop to 'Jury Duty' position
    And I save changes
    Then I should see the following group items
      | List                 |
      | Holiday Pay          |
      | Floating Holiday Pay |
      | Vacation             |
      | Jury Duty            |
      | Overtime             |
      | Regular Earnings     |

  Scenario: Admin can drag nodes out of a group
    When I go to 'Expenses' tab
    And I group multiple elements via right click menu
      | item1  | Regular Earnings     |
      | item2  | Floating Holiday Pay |
      | item3  | Vacation             |
      | item4  | Jury Duty            |
      | item5  | Overtime             |
    And I expand just created group
    And I click on 'Jury Duty' column item
    And I drag 'Jury Duty' item and drop to 'Call-Back Pay' position
    Then I should see the following group items
      | List                 |
      | Overtime             |
      | Vacation             |
      | Floating Holiday Pay |
      | Regular Earnings     |