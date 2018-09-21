Feature: CoA Masking - Test Khilko entity

  Scenario: Can hide category
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click on Manage CoA masks button for 'CoA_Cerritos_v0' CoA
    When I expand or collapse all
    When I hide 'Fund Category'
    Then I should see hid trees
      | General fund                |
      | Special revenue funds       |
      | Enterprise funds            |
      | Capital projects funds      |
      | Internal service funds      |
      | Unassigned                  |
      | Debt service funds          |
      | Private-purpose trust funds |