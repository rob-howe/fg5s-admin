Feature: Update an existing team

  Scenario: Modify paid status
    Given I am logged in
    And an U7 team has been entered
    When click edit U7 team
    And click paid
    And save
    Then I should see the U7 team has paid

