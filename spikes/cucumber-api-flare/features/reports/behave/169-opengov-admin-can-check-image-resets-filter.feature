@serial @wv @wip
Feature: OpenGov Admin can check image resets filter

 
  @ORPHAN @ie
  Scenario: Can check image holds filter from single image hyperlinks

    When I am logged as an 'OpenGov Admin' in 'State of West Virginia' entity
    And I select the 'zzTransactions' report
    Then I check image holds filter from single image hyperlinks


  @ORPHAN @ie
  Scenario: Can check image holds filter from multiple image hyperlinks

    When I am logged as an 'OpenGov Admin' in 'State of West Virginia' entity
    And I select the 'zzTransactions' report
    Then I check image holds filter from multiple image hyperlinks

