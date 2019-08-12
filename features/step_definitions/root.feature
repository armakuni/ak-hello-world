Feature: Hello World

  Scenario: Root
    Given The app is deployed
    When I make a request to '/'
    Then I should receive '{"message":"Hello World"}'
