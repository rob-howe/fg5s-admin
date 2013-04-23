Given /^I go to the login page$/ do
    visit_page LogInPage
end

When /^I enter '(.*)' in user name$/ do |user|
  @current_page.user_name = user
end

When /^I enter '(.*)' in password$/ do |password|
  @current_page.user_password = password
end

When /^I login$/ do
  @current_page.login
end
Then /^I should see the summary heading$/ do
  on_page 'SummaryPage'
  @current_page.heading.should == 'Team Summary'
end