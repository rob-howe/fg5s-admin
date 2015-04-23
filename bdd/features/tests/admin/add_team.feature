Feature: Add an new team

  Background: I login
    Given I go to the login page
    When I enter 'Rob' in user name
    And I enter 'rh20!!' in password
    And I login

  Scenario: I add a new team
    Given I click 'Add Team'
    And I select age group 'U11'
    And I enter 'Test Add FC' in club name
    And I enter 'Add' in designation
    And I enter 'My Team League Name' in league
    And I enter 'West A' in division
    And I enter 'Fred The Man' in manger name
    And I enter 'fred@gmail.com' in email address
    And I enter '07777 86555' in mobile phone
    And I enter '01211 578888' in home phone
    And I enter 'Add line 1' in address line 1
    And I enter 'Add line 2' in address line 2
    And I enter 'Town' in town
    And I enter 'County' in county
    And I enter 'EX7 8UU' in postcode
    And I submit the team
    Then I should see the heading 'Fives Team'
    And I should see age group 'U11'
    And I should see club name 'Test Add FC'
    And I should see league 'My Team League Name'
    And I should see division 'West A'
    And I should see email address 'fred@gmail.com'
    And I should see mobile phone '07777 86555'
    And I should see home phone '01211 578888'
