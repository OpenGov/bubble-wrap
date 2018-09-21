@tab @serial
Feature: Switching chart of accounts displays different reports


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @ie
  Scenario Outline: Switching chart of accounts displays different reports

    When I select <type_coa> coa
    Then I should <action> linked to default coa '<report_name>' report
    Examples:
      | type_coa  | action  | report_name |
      | default   | see     | st 1coa     |
      | undefault | not see | st 1coa     |

