Given /^I go to the register page$/ do
  visit_page RegisterPage
end
Then /^I should see the top heading with '(.*)'$/ do |heading|
  @current_page.heading.should == heading
end
Then /^I should see the confirmation heading with '(.*)'$/ do| heading|
  @current_page.confirmation_heading_element.when_present
  @current_page.confirmation_heading.should == heading
end
When /^I select age group '(.*)'$/ do |age_group|
  @current_page.age_group = age_group
end
When /^I enter '(.*)' in club name$/ do |club_name|
  @current_page.team_name = club_name
end
When /^I enter '(.*)' in designation$/ do |designation|
  @current_page.designation = designation
end
When /^I enter '(.*)' in league$/ do |league|
  @current_page.league = league
end
When /^I enter '(.*)' in division$/ do |division|
  @current_page.division = division
end
When /^I enter '(.*)' in manger name$/ do |manager_name|
  @current_page.manager_name = manager_name
end
When /^I enter '(.*)' in email address$/ do |email_address|
  @current_page.email_address = email_address
end
When /^I enter '(.*)' in mobile phone$/ do |number|
  @current_page.mobile_phone = number
  end
When /^I enter '(.*)' in home phone$/ do |number|
  @current_page.home_phone = number
end
When /^I enter '(.*)' in address line 1$/ do |line1|
  @current_page.address_line1 = line1
  end
When /^I enter '(.*)' in address line 2$/ do |line2|
  @current_page.address_line2 = line2
end
When /^I enter '(.*)' in town$/ do |town|
  @current_page.town = town
  end
When /^I enter '(.*)' in county$/ do |county|
  @current_page.county = county
  end
When /^I enter '(.*)' in postcode$/ do |postcode|
  @current_page.postcode = postcode
end
When /^I submit my team$/ do
  @current_page.submit_team
end
When /^I should see age group '(.*)'$/ do |age_group|
  @current_page.registered_age_group_element.when_present
  @current_page.registered_age_group.should == age_group
end
When /^I should see club name '(.*)'$/ do |club_name|
  @current_page.registered_club_name.should == club_name
end
When /^I should see club name '(.*)'$/ do |club_name|
  @current_page.registered_club_name.should == club_name
end
When /^I should see league '(.*)'$/ do |league|
  @current_page.registered_league.should == league
end
When /^I should see division '(.*)'$/ do |division|
  @current_page.registered_division.should == division
end
When /^I should see mobile phone '(.*)'$/ do |mobile_phone|
  @current_page.registered_mobile_phone.should == mobile_phone
end
When /^I should see home phone '(.*)'$/ do |home_phone|
  @current_page.registered_home_phone.should == home_phone
end


Then /^I the error messages should contain '(.*)'$/ do |message|
  @current_page.errors.should include message
end
