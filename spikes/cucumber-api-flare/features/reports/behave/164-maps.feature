@maps @wip
Feature: Maps

 
  @ORPHAN @ie
  Scenario: Maps display tooltips

    Given I am an entity admin
    When I create a grid report with 'Geo Dataset'
    Then I should be in tooltip edit mode

