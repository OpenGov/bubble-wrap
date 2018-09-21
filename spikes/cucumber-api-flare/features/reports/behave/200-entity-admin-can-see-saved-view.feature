Feature: Entity admin can see saved view

 
  @ES-3651 @assignee:areder @OPEN
  Scenario: Saved views are available for the user - map dataset

    Given I am logged into tzayan as an entity_admin
    And I select the 'Rental Map' report
    When I go to Views
    And I select view - 'Annual Rentals'
    Then I should see this view

