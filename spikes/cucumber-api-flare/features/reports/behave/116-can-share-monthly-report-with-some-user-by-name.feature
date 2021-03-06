@sharing
Feature: Can share Monthly report with some user by name


  Background:
    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN
  Scenario: Can add other users to report as readers

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    Then I should be able to add this user to report as reader


  @ORPHAN
  Scenario: Can promote invited users to report admins

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    Then I should be able to add this user to report as admin


  @ORPHAN
  Scenario: Can remove users from the report

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    Then I should be able to remove this user from the report


  @ORPHAN
  Scenario: Can cancel sending a message

    When I share report with 'Tim Timin' user
    And I cancel sending process
    Then I shouldn't see share panel


  @ORPHAN
  Scenario: ability to transfer ownership of the report to another person

    When I share report with 'Tim Timin' user
    And I click on 'Can View' button
    Then I should be able to transfer ownership of the report to this user

