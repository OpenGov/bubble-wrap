Feature: Dataset List Limitation

  Scenario Outline: Dataset List displayed up to 300 datasets
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I create <uploaded_number> non-linked datasets without file
    Then Dataset List has <displayed number> uploaded datasets

    Examples:
    | uploaded_number | displayed number |
    | 99              | 99               |
    | 299             | 299              |
    | 300             | 300              |
    | 301             | 300              |
    | 320             | 300              |
