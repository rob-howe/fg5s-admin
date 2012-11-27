Given /^I goto the home page$/ do
  visit_page HomePage
end
Then /^I should see the top heading with '(.*)'$/ do |heading|
  @current_page.top_heading.text.should == heading
end