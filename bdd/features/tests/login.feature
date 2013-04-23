Feature: Test the admin area login

  Scenario: A user logs in ok
    Given I go to the login page
    When I enter 'Rob' in user name
    And I enter 'rh20!!' in password
    And I login
    Then I should see the summary heading