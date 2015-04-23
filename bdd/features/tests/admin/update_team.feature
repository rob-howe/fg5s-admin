Feature: Update an existing team

  Background: I login
    Given I go to the login page
    When I enter 'Rob' in user name
    And I enter 'rh20!!' in password
    And I login


  Scenario: Modify paid status
    And an U7 team has been entered
    When click edit U7 team
    And click paid
    And save
    Then I should see the U7 team has paid

