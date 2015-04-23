Given(/^I click 'Add Team'$/) do
  click_button 'Add Team'
end

When /^I submit the team$/ do
  click_button('Submit The Application')
end


Then(/^I should see the heading '(.*)'$/) do |heading|
  expect(page.find('#heading').text).to eq heading
end