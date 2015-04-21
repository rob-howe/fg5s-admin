Feature: Test the register team page

  Scenario: I can submit valid data
    Given I go to the register page
    Then I should see the top heading with 'Register Your Team for the FG5's 2015'
    And I select age group 'U8'
    And I enter 'Test FC' in club name
    And I enter 'Storm' in designation
    And I enter 'My Team League Name' in league
    And I enter 'Premier' in division
    And I enter 'Fred McStay' in manger name
    And I enter 'robert.howe@gmail.com' in email address
    And I enter '07889 86555' in mobile phone
    And I enter '01233 578888' in home phone
    And I enter 'Address line 1' in address line 1
    And I enter 'Address line 2' in address line 2
    And I enter 'Enfield' in town
    And I enter 'Middlesex' in county
    And I enter 'EN7 8UU' in postcode
    And I submit my team
    Then I should see the confirmation heading with 'Thank You for Your Application to the FG5's 2015'
    And I should see age group 'U8'
    And I should see club name 'Test FC Storm'
    And I should see league 'My Team League Name'
    And I should see division 'Premier'
    And I should see email address 'robert.howe@gmail.com'
    And I should see mobile phone '07889 86555'
    And I should see home phone '01233 578888'


  Scenario: Validate the age group must be selected
    Given I go to the register page
    And I submit my team
    Then I the error messages should contain 'Please select an age group'
    Then I the error messages should contain 'Please provide your Club/Team Name'
    Then I the error messages should contain 'Please enter the Manager's Name'
    Then I the error messages should contain 'Please enter a Mobile Phone Number'
    Then I the error messages should contain 'Please enter an Email Address'

  @clean_age_group
  Scenario: A team age group is closed
    Given the U8 team is closed
    When I go to the register page
    Then I should see a message saying the U8 team is closed
    And the age group drop down should not contain the U8 option

  @clean_age_group
  Scenario: Multiple team age groups are closed
    Given the U8 team is closed
    And the U11 team is closed
    When I go to the register page
    Then I should see a message saying the U8, U11 teams are closed
    And the age group drop down should not contain the U8 option
    And the age group drop down should not contain the U11 option