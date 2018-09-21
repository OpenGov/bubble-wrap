@tab
Feature: Report selection


  Background:
    Given I am logged on as an OpenGov admin
    When I am in a 'sausalitoca' entity
    And I go to reports from visitor_analytics page

 
  @ORPHAN @ie
  Scenario: Reports can be selected with one click

    When I select the '5 Year Capital Improvement Plan' report
    Then I should see '5 Year Capital Improvement Plan' report opened


  @ORPHAN
  Scenario: Reports are arranged in a logical order

    Then I should see that reports are arranged in Alphabet order

