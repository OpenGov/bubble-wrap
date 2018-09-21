Feature: Benchmark Dataset performance

  Scenario Outline:  Multiple Uploads to Non-Linked Dataset
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I measure Non-Linked dataset performance for benchmark/<DS> with '5' samples
      | Financial Year  | Fiscal year |
      | Amount          | Amount      |
    Then Post performance summary to 'Multisamples'

    Examples:
      | DS                 |
      | arizona_5K.csv     |
      | arizona_100K.csv   |

  Scenario Outline:  Multiple Uploads to Linked Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'pharaoh' entity
    And I go to data manager from visitor_analytics page
    When I measure Linked dataset performance for benchmark/<DS> with '5' samples
      | Financial Year   | Fiscal year            |
      | Amount           | Amount                 |
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
    Then Post performance summary to 'Multisamples'

    Examples:
      | DS                 |
      | arizona_5K.csv     |
      | arizona_100K.csv   |