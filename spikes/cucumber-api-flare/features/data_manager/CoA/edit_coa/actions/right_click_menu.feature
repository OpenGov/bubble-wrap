Feature: Edit CoA - Right Click Menu
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @p1
  Scenario Outline: User can edit column data via right click menu
    When I go to '<tab>' tab
    And I click edit '<item>' element via right click menu
    And I fill in new column item name '<input>'
    Then I should see '<input>' column element

    Examples:
      | tab         | item               | input            |
      | Assets      | Receivables        | Receivables Test |
      | Funds       | Capital Projects   | Test Projects    |
      | Revenues    | Property Taxes     | Property_Taxes   |
      | Liabilities | Due to Other Funds | Other Funds      |

  @p1
  Scenario: User can delete unused item via right click menu
    When I add new 'Some deparment' item to the column
    And I click delete 'Some deparment' element via right click menu
    Then I shouldn't see 'Some deparment' column element

  @p2
  Scenario: User can group elements via right click menu
    When I go to 'Counts' tab
    And I create new group using 'FTE Count' via right click menu
    Then I should see 'FTE Count' column element

  @p2
  Scenario: User can ungroup elements via right click menu
    When I go to 'Funds' tab
    And I create new group using 'Road Use Tax Fund' via right click menu
    And I ungroup 'Road Use Tax Fund' via right click menu
    Then I should see 'Road Use Tax Fund' column element

  @p1
  Scenario: User can group multiple elements via right click menu
    When I go to 'Departments' tab
    And I group multiple elements via right click menu
      | item1 | Police Operations       |
      | item2 | Police Special Services |
      | item3 | Police Support Services |
    Then I should see 'Police Operations' column element

  Scenario: User can delete multiple unused department
    When I add new 'Some item1' item to the column
    And I add new 'Some item2' item to the column
    And I add new 'Some item3' item to the column
    And I ctrl click on 3 items in program categories column
      | item1 | Some item1 |
      | item2 | Some item2 |
      | item3 | Some item3 |
    And I click delete 'Some item1' element via right click menu
    Then I shouldn't see 'Some item1' column element
    And I shouldn't see 'Some item2' column element
    And I shouldn't see 'Some item3' column element

  @p2 @release_run
  Scenario: User can quit recategorize modal
    When I go to 'Funds' tab
    And I click recategorize 'Fire Gift Fund' element via right click menu
    Then I should be able to quit modal

  @p2
  Scenario: User can cancel recategorize modal
    When I go to 'Funds' tab
    And I click recategorize 'Fire Gift Fund' element via right click menu
    Then I should be able to cancel modal

  Scenario: User can change account type for Uncategorized via right click menu
    When I go to 'Uncategorized' tab
    And I change account type of '491-2491.5328' to 'Equities' via right click menu
    And I go to 'Uncategorized' tab
    And I shouldn't see '491-2491.5328' column element
    And I go to 'Equities' tab
    Then I should see '491-2491.5328' column element

  Scenario Outline: User can't change account type for Uncategorized via right click menu
    When I go to '<tab>' tab
    And I open right click menu for '<item>' column item
    Then I shouldn't see 'Change Account Type' rclick menu option

    Examples:
      | tab         | item               |
      | Assets      | Receivables        |
      | Expenses    | Capital Outlay     |
      | Revenues    | Property Taxes     |
      | Liabilities | Due to Other Funds |
      | Equities    | Appropriations     |
