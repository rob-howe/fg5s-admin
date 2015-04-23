Given /^I go to the register page$/ do
  visit '/register'
end
Then /^I should see the top heading with '(.*)'$/ do |heading|
  expect(page.find('#heading').text).to eq heading
end
Then /^I should see the confirmation heading with '(.*)'$/ do| heading|
  expect(page.find('#confirmation_heading').text).to eq heading
end
When /^I select age group '(.*)'$/ do |age_group|
  select(age_group, :from => 'age_group_id')
end
When /^I enter '(.*)' in club name$/ do |club_name|
  fill_in('team_name', with: club_name)
end
When /^I enter '(.*)' in designation$/ do |designation|
  fill_in('designation', with: designation)
end
When /^I enter '(.*)' in league$/ do |league|
  fill_in('league', with: league)
end
When /^I enter '(.*)' in division$/ do |division|
  fill_in('division', with: division)
end
When /^I enter '(.*)' in manger name$/ do |manager_name|
  fill_in('manager_name', with: manager_name)
end
When /^I enter '(.*)' in email address$/ do |email_address|
  fill_in('email_address', with: email_address)
end
When /^I enter '(.*)' in mobile phone$/ do |number|
  fill_in('mobile_phone', with:number)
end
When /^I enter '(.*)' in home phone$/ do |number|
  fill_in('home_phone', with:number)
end
When /^I enter '(.*)' in address line 1$/ do |line1|
  fill_in('address_line1', with: line1)
end
When /^I enter '(.*)' in address line 2$/ do |line2|
  fill_in('address_line2',with: line2)
end
When /^I enter '(.*)' in town$/ do |town|
  fill_in('town',with: town)
end
When /^I enter '(.*)' in county$/ do |county|
  fill_in('county', with: county)
end
When /^I enter '(.*)' in postcode$/ do |postcode|
  fill_in('postcode', with: postcode)
end
When /^I submit my team$/ do
  click_button('Submit Your Application')
end
When /^I should see age group '(.*)'$/ do |age_group|
  expect(page.find('#registered_age_group').text).to eq age_group
end
When /^I should see club name '(.*)'$/ do |club_name|
  expect(page.find('#registered_club_name').text).to eq club_name
end
When /^I should see league '(.*)'$/ do |league|
  expect(page.find('#registered_league_name').text).to eq league
end
When /^I should see division '(.*)'$/ do |division|
  expect(page.find('#registered_division').text).to eq division
end
When /^I should see mobile phone '(.*)'$/ do |mobile_phone|
  expect(page.find('#registered_mobile_phone').text).to eq mobile_phone
end
When /^I should see email address '(.*)'$/ do |email_address|
  expect(page.find('#registered_email_address').text).to eq email_address
end
When /^I should see home phone '(.*)'$/ do |home_phone|
  expect(page.find('#registered_home_phone').text).to eq home_phone
end


Then /^I the error messages should contain '(.*)'$/ do |message|
  expect(page.find('#errors')).to have_content message
end


Then(/^I should see a message saying the (.*) (team is|teams are) closed$/) do |teams, plural|
  expect(page.find('#closed_age_groups')).to have_content teams
end

And(/^the age group drop down should not contain the (.*) option$/) do |team|
  select_options = page.find('#age_group').all('option').collect{|option|(option.text)}
  expect(select_options.include?(team)).to be false
end