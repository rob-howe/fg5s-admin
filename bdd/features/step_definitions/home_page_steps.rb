Given /^I go to the register page$/ do
  visit_page RegisterPage
end
Then /^I should see the top heading with '(.*)'$/ do |heading|
  @current_page.heading.should == heading
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