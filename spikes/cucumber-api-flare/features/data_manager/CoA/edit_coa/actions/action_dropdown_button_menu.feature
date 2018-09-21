Feature: Edit CoA - Action Dropdown Button
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @p1 @phantom @release_run
  Scenario Outline: User can edit column data via action dropdown button
    When I go to '<tab>' tab
    And I click on '<item>' column item
    And I click 'Edit' via action dropdown button
    And I fill in new column item name '<input>'
    Then I should see '<input>' column element

    Examples:
      | tab         | item              | input             |
      | Departments | Police            | Police Department |
      | Expenses    | Personal Services | Personal_Services |

  @p1
  Scenario: User can delete unused item via action dropdown button
    When I add new 'Some deparment' item to the column
    And I click 'Delete' via action dropdown button
    Then I shouldn't see 'Some deparment' column element

  @p1 @phantom @release_run
  Scenario: User can group elements via action dropdown button
    When I go to 'Counts' tab
    And I create new group using 'FTE Count' via action dropdown button
    Then I should see 'FTE Count' column element

  @p1 @phantom @release_run
  Scenario: User can ungroup elements via action dropdown button
    When I go to 'Funds' tab
    And I create new group using 'Road Use Tax Fund' via action dropdown button
    And I ungroup 'Road Use Tax Fund' via action dropdown button
    Then I shouldn't see 'New Group' column element
    And I should see 'Road Use Tax Fund' column element

  @p1 @release_run
  Scenario: User can delete multiple unused department
    When I add new 'Some item1' item to the column
    And I add new 'Some item2' item to the column
    And I add new 'Some item3' item to the column
    And I ctrl click on 3 items in program categories column
      | item1 | Some item1 |
      | item2 | Some item2 |
      | item3 | Some item3 |
    And I click 'Delete' via action dropdown button
    Then I shouldn't see 'Some item1' column element
    And I shouldn't see 'Some item2' column element
    And I shouldn't see 'Some item3' column element

  Scenario: User can change account type for Uncategorized via Action button
    When I go to 'Uncategorized' tab
    And I change account type of '925-2925.5428' to 'Equities' via action dropdown button
    And I go to 'Uncategorized' tab
    And I shouldn't see '925-2925.5428' column element
    And I go to 'Equities' tab
    Then I should see '925-2925.5428' column element

  Scenario Outline: User can't change account type for Uncategorized via Action button
    When I go to '<tab>' tab
    And I click on '<item>' column item
    And I open action button menu
    Then I shouldn't see 'Change Account Type' action button menu option

    Examples:
      | tab         | item               |
      | Assets      | Receivables        |
      | Expenses    | Capital Outlay     |
      | Revenues    | Property Taxes     |
      | Liabilities | Due to Other Funds |
      | Equities    | Appropriations     |