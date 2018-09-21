Feature: Create cost element
  Background:
    Given I turn on workforce feature for 'gotham' entity
    And I am logged into gotham as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel
    And I start to create a new workforce plan
    And I select the workforce plan
    And I start to setup Cost Elements

  @wf_bvt
  Scenario: Create Hourly Wage cost element
    When I select cost element 'Hourly Wage'
    And I complete 'Hourly Wage' Cost Element form - type 1
    Then I see 'Hourly Wage' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Overtime cost element
    When I select cost element 'Overtime'
    And I complete 'Overtime' Cost Element form - type 1
    Then I see 'Overtime' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Holiday Bonus cost element
    When I select cost element 'Holiday Bonus'
    And I complete 'Holiday Bonus' Cost Element form - type 1
    Then I see 'Holiday Bonus' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Merit Increase cost element
    When I select cost element 'Merit Increase'
    And I complete 'Merit Increase' Cost Element form - type 2
    Then I see 'Merit Increase' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Bonus cost element
    When I select cost element 'Bonus'
    And I complete 'Bonus' Cost Element form - type 2
    Then I see 'Bonus' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Cost of Living Increase cost element
    When I select cost element 'Cost of Living Increase'
    And I complete 'Cost of Living Increase' Cost Element form - type 3
    Then I see 'Cost of Living Increase' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create FICA cost element
    When I select cost element 'FICA'
    And I complete 'FICA' Cost Element form - type 3
    Then I see 'FICA' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create MCare cost element
    When I select cost element 'MCare'
    And I complete 'Medicare' Cost Element form - type 3
    Then I see 'Medicare' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Health cost element
    When I select cost element 'Health'
    And I complete 'Health Insurance' cost element form - lookup table
    Then I see 'Health Insurance' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Pension cost element
    When I select cost element 'Pension'
    And I complete 'Pension' cost element form - lookup table
    Then I see 'Pension' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Bargaining Unit cost element
    When I select cost element 'Bargaining Units'
    And I complete 'Bargaining Units' cost element form - lookup table
    Then I see 'Bargaining Units' cost element is listed on the side bar

  @wf_bvt
  Scenario: Create Equipment cost element
    When I select cost element 'Equipment'
    And I complete 'Equipment' cost element form - lookup table
    Then I see 'Equipment' cost element is listed on the side bar

  @wf_bvt
  Scenario: Update a cost element
    When I select cost element 'Hourly Wage'
    And I complete 'Hourly Wage' Cost Element form - type 1
    And I see 'Hourly Wage' cost element is listed on the side bar
    And I update the default value of 'Hourly Wage' to 1234
    Then The default value is updated to 1234