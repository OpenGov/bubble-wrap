Feature: Export GLReport Default Setting

 
  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: Opens export model_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the 'mn' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should be able to see download model


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default "Title & Description" is selected_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the 'mn' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Include Title & Description' checkbox is selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1 @ie
  Scenario: By default "Table & Chart" option is selected_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the 'mn' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Chart & Table' image type selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: Opens export model_OpengovEngineer

    Given I am logged as 'OpenGov Engineer' in 'Tobolsk' entity
    And I select the 'std' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should be able to see download model


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1 @ie
  Scenario: By default Title & Description is selected_OpengovEngineer

    Given I am logged as 'OpenGov Engineer' in 'Tobolsk' entity
    And I select the 'std' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Include Title & Description' checkbox is selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default "Table & Chart" option is selected_OpengovEngineer

    Given I am logged as 'OpenGov Engineer' in 'Tobolsk' entity
    And I select the 'std' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Chart & Table' image type selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1 @ie
  Scenario: Opens export model_EntityUser

    Given I am logged into Tobolsk as an entity_user
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should be able to see download model


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default Title & Description is selected_EntityUser

    Given I am logged into Tobolsk as an entity_user
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Include Title & Description' checkbox is selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default "Table & Chart" option is selected_EntityUser

    Given I am logged into Tobolsk as an entity_user
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Chart & Table' image type selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: Opens export model_EntityAdmin

    Given I am logged into Tobolsk as an entity_admin
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should be able to see download model


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default Title & Description is selected_EntityAdmin

    Given I am logged into Tobolsk as an entity_admin
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Include Title & Description' checkbox is selected


  @OLY-422 @assignee:sanvekar_at_opengov.com @version:18.1.1 @COMPLETED @download @version:18.1.1
  Scenario: By default "Table & Chart" option is selected_EntityAdmin

    Given I am logged into Tobolsk as an entity_admin
    When I select the 'bl' report
    And I click on Download button
    When I open 'Image (.png) ' format
    Then I should see 'Chart & Table' image type selected

