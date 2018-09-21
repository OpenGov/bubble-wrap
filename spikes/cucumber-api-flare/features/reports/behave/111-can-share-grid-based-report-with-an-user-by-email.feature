@sharing
Feature: Can share Grid-based report with an user by email


  Background:
    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN
  Scenario: Can add other users to report as readers

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I click on 'Can View' button
    Then I should be able to add this user to report as reader


  @ORPHAN
  Scenario: Can promote invited users to report admins

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I click on 'Can View' button
    Then I should be able to add this user to report as admin


  @ORPHAN
  Scenario: Can remove users from the report

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I click on 'Can View' button
    Then I should be able to remove this user from the report


  @ORPHAN
  Scenario: Can cancel sending a message

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I cancel sending process
    Then I shouldn't see share panel


  @ORPHAN @ie
  Scenario: ability to transfer ownership of the report to another person

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I click on 'Can View' button
    Then I should be able to transfer ownership of the report to this user

