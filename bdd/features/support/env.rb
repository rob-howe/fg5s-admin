require 'rspec/expectations'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'cgi'


World PageObject::PageFactory


ENV['BROWSER'].nil? ? BROWSER_NAME = :firefox : BROWSER_NAME = ENV['BROWSER'].to_sym

#browser = Watir::Browser.new(BROWSER_NAME, :profile=>"default")
browser = Watir::Browser.new(:firefox)

Before do
  @browser = browser
end

at_exit do
  #browser.close
end


