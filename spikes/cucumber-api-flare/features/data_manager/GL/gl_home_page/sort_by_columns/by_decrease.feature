@frictionless @phantom @p2
Feature: Sort by decrease

  Background:
    Given I am logged into gotham as an entity_admin
    And I go to data manager from reports page

  Scenario: Sort by decrease by name
    When I sort Data Sets by decrease by name
    Then I should see sorted Data Sets

  Scenario: Sort by decrease by filename
    When I sort Data Sets by decrease by filename
    Then I should see sorted Data Sets

  Scenario: Sort by decrease by type
    When I sort Data Sets by decrease by type
    Then I should see sorted Data Sets

  Scenario: Sort by decrease by year
    When I sort Data Sets by decrease by year
    Then I should see sorted Data Sets

  Scenario: Sort by decrease by month
    When I sort Data Sets by decrease by month on monthly tab
    Then I should see sorted Data Sets

  Scenario: Sort by decrease by date uploaded
    When I sort Data Sets by decrease by date uploaded
    Then I should see sorted Data Sets