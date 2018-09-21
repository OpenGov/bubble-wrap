Feature: Edit CoA - Drag & Drop

  Scenario: Admin can categorize codes into different parents with drag and drop
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Funds' tab
    And I add new level for 'Funds' column
    And I rename 'New Level' column to 'Fund Test Level'
    And I add new 'Fund Test Node' item to the column
    And I drag the following items and drop to 'Fund Test Node' position
      | item1  | CCPA Endowment Fund          |
      | item2  | Earthquake Preparedness Fund |
      | item3  | Art In Public Places Fund    |
      | item4  | Rose Parade Float Fund       |
      | item5  | Drainage Fund                |
      | item6  | SB 821 Fund                  |
      | item7  | Aqmd Fund                    |
      | item8  | Measure "R" Fund             |
      | item9  | Proposition "A" Fund         |
      | item10 | Proposition "C" Fund         |
    And I save changes
    Then I should see '10' highlighted items in the 'Funds' column

  Scenario: Admin can group or ungroup codes with drag and drop
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Funds' tab
    And I group multiple elements via right click menu
      | item1  | Street Improvement Fund       |
      | item2  | Drainage Fund                 |
      | item3  | SB 821 Fund                   |
      | item4  | Aqmd Fund                     |
      | item5  | Measure "R" Fund              |
    And I expand just created group
    And I click on 'Advance Repayment Holding Fund' column item
    And I drag 'Measure "R" Fund' item and drop to 'Advance Repayment Holding Fund' position
    And I drag 'Measure "R" Fund' item and drop to 'Aqmd Fund' position
    And I save changes
    Then I should see the following group items
      | List                          |
      | Measure "R" Fund              |
      | Street Improvement Fund       |
      | Drainage Fund                 |
      | SB 821 Fund                   |
      | Aqmd Fund                     |

  @p1
  Scenario: As an admin I can group or ungroup codes with drag and drop
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Funds' tab
    And I group multiple elements via right click menu
      | item1  | Fire Gift Fund                |
      | item2  | Hawkeye Park Player Fees Fund |
      | item3  | Police Gift Fund              |
      | item4  | Road Use Tax Fund             |
      | item5  | Police Seizure Fund           |
    And I expand just created group
    And I click on 'Police and Fire Retirement Fund' column item
    And I drag 'Police Gift Fund' item and drop to 'Police and Fire Retirement Fund' position
    And I drag 'Police Gift Fund' item and drop to 'Police Seizure Fund' position
    Then I should see the following group items
      | List                          |
      | Police Gift Fund              |
      | Road Use Tax Fund             |
      | Police Seizure Fund           |
      | Hawkeye Park Player Fees Fund |
      | Fire Gift Fund                |

  @bvt @phantom @release_run
  Scenario: User can drag and drop elements
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Funds' tab
    And I drag 'Business Type Activities/Enterprise' item and drop to 'Special Revenue' position
    Then I should see the following order
      |   List                              |
      | General                             |
      | Business Type Activities/Enterprise |
      | Special Revenue                     |
      | Debt Service                        |
      | Capital Projects                    |