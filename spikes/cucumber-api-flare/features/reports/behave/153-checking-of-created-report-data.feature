@tab
Feature: Checking of created report data

 
  @ORPHAN @ie
  Scenario: Checking of Update date element

    When I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    Then I should see an 'Updated date'


  @ORPHAN @ie
  Scenario: Checking of type of reports sharing

    When I am logged as an 'OpenGov Admin' in 'pekinil' entity
    Then I should see types of reports sharing


  @ORPHAN @ie
  Scenario: Checking graph thumbnail elements

    When I am logged as an 'OpenGov Admin' in 'pekinil' entity
    Then I should see all types of graph thumbnail elements

