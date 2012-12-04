Given /^I go to the register page$/ do
  visit_page RegisterPage
end
Then /^I should see the top heading with '(.*)'$/ do |heading|
  @current_page.heading.should == heading
end