Feature: Create a Workforce Plan
  Background:
    Given I turn on workforce feature for 'gotham' entity
    And I am logged into gotham as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel

  @wf_bvt
  Scenario: Create a new workforce (Happy pass)
    When I start to create a new workforce plan
    Then I see the workforce plan is listed

  @wf_bvt
  Scenario: Update a workforce plan basic info
    When I start to create a new workforce plan
    And I select the workforce plan
    And I go to workforce plan setting
    And I updated the workforce plan
    And I go to workforce plan setting
    Then The workforce is updated
    
  Scenario: Create a new workforce plan without starting date
    Whe  I start to create a new workforce plan without a starting date
    Then I see an error message prompt

  Scenario: Workforce Plan creation without ending date
    When I start to create a new workforce plan without a starting date
    Then I see an error message prompt

  Scenario: Workforce Plan creation without name
    When I start to create a new workforce plan without a name
    Then I see an error message prompt

  Scenario: Workforce Plan creation without a description
    When I start to create a new workforce plan without a description
    Then I see an error message prompt

  Scenario: Download Workforce plan template
    When I created a workforce plan
    And I select the workforce plan
    And I start to setup Cost Elements
    And I select cost element Holiday
    And I complete the Cost Element form
    And I select position tab
    Then I download the template

  Scenario: Upload a completed template
    When I created a workforce plan
    And I select the workforce plan
    And I upload a completed template
    Then I see uploaded positions listed





















