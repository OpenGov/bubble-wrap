@frictionless @phantom @p2
Feature: Sort by increase

  Background:
    Given I am logged into gotham as an entity_admin
    And I go to data manager from reports page

  Scenario: Sort by increase by name
    When I sort Data Sets by increase by name
    Then I should see sorted Data Sets

  Scenario: Sort by increase by filename
    When I sort Data Sets by increase by filename
    Then I should see sorted Data Sets

  Scenario: Sort by increase by type
    When I sort Data Sets by increase by type
    Then I should see sorted Data Sets

  Scenario: Sort by increase by year
    When I sort Data Sets by increase by year
    Then I should see sorted Data Sets

  Scenario: Sort by increase by month
    When I sort Data Sets by increase by month on monthly tab
    Then I should see sorted Data Sets

  Scenario: Sort by increase by date uploaded
    When I sort Data Sets by increase by date uploaded
    Then I should see sorted Data Sets