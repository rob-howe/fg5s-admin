Feature: Test the register team page

  Scenario: I go to the home page
    Given I go to the register page
    Then I should see the top heading with 'Register Your Team for the FG5's 2013'
    And I select age group 'U8'
    And I enter 'Test FC' in club name
    And I enter 'Storm' in designation
    And I enter 'Storm' in designation
    And I enter 'Fred McStay' in manger name
    And I enter 'fred@mcstay.co.uk' in email address
    And I enter '07889 86555' in mobile phone
    And I enter '01233 578888' in home phone
    And I enter 'Address line 1' in address line 1
    And I enter 'Address line 2' in address line 2
    And I enter 'Enfield' in town
    And I enter 'Enfield' in town
    And I enter 'Middlesex' in county
    And I enter 'EN7 8UU' in postcode
    And I submit my team
    Then I should see the confirmation heading with 'Thank You for Your Application to the FG5's 2013'
    And I should see age group U8
    And I should see club name 'Test FC Storm'
    And I should see email address 'fred@mcstay.co.uk'
    And I should see mobile phone '07889 86555'
    And I should see home phone '01233 578888'


