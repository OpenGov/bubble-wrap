@release_run
Feature: Edit CoA - Edit Column Item

  @p1 @phantom
  Scenario Outline: User can alter names of organizational segments
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I fill in new '<input>' name for '<tab>' tab
    Then I should see altered name '<input>'

    Examples:
      | tab         | input                  |
      | Funds       | Funds2016              |
      | Funds       | Funds_2016             |
      | Funds       | _Funds2016             |
      | Funds       | Funds@director2016     |
      | Departments | Dapartments2016        |
      | Departments | Dapartment_policy      |
      | Departments | _Dapartments2016_02    |
      | Departments | Dapartments2016@hr2016 |

  @bug @ES-3122
  Scenario Outline: User can edit column names
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to '<tab>' tab
    And I rename '<column>' column to '<new_name>'
    Then I should see '<new_name>' column name

    Examples:
      | tab         | column        | new_name      |
      | Departments | Division      | New Division  |
      | Funds       | Fund Category | Category      |
      | Expenses    | Object Type   | Type          |
      | Equities    | Category      | Test Category |

  Scenario: Admin can rename items and reload after save
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Assets' tab
    And I click on '10112' column item
    And I click on 'Cash - Payroll' column item
    And I rename 'Cash - Payroll' code description to 'Test Assets' by double click
    And I save changes
    And I reload a coa_edit page
    And I go to 'Assets' tab
    Then I should see 'Test Assets' column element

  Scenario: Admin can move a code with the recategorize modal and reload after save
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I reload a data manager page
    And I go to CoA page from data manager page
    And I click edit CoA
    When I go to 'Revenues' tab
    And I click recategorize 'Business License' element via right click menu
    And I type in new parents for the code
    And I save changes
    And I reload a coa_edit page
    And I go to 'Revenues' tab
    And I click on 'Franchises' column item
    Then I should see highlighted 'Business License' item