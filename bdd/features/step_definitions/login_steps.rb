Given /^I go to the login page$/ do
    visit '/'
end

When /^I enter '(.*)' in user name$/ do |user|
  fill_in('login', with: user)
end

When /^I enter '(.*)' in password$/ do |password|
  fill_in('password', with: password)
end

When /^I login$/ do
  click_button('login')
end

Then /^I should see the summary heading$/ do
  expect(page.title).to eq 'Team Summary'
end