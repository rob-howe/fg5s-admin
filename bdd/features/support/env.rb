LIB_PATH = File.expand_path(File.dirname(__FILE__) + '/../../../lib')

$LOAD_PATH.unshift LIB_PATH unless $LOAD_PATH.include?(LIB_PATH)
$LOAD_PATH.unshift "#{__dir__}/../"

require 'rspec/expectations'
require 'sinatra/activerecord'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'cgi'
require 'rspec'

LOCAL_URL = 'http://localhost:4569'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false, timeout: 50, phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes','--ssl-protocol=any']})
end

Capybara.javascript_driver = :poltergeist
Capybara.app_host = "#{LOCAL_URL}"
Capybara.run_server = false
Capybara.default_wait_time = 5

Capybara.register_driver :chrome do |app|
  options = {}
  options[:browser] = :chrome
  Capybara::Selenium::Driver.new(app, options)
end

Capybara.default_driver = :poltergeist


Capybara.app = '/'

ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: 'forest_glade',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: 'password'
)
#
# commands = IO.read("#{LIB_PATH}/db/db_schema.sql").split(';')
# commands.each do |command|
#   ActiveRecord::Base.connection.execute("#{command};")
# end
# ActiveRecord::Base.logger.level = Logger::WARN

Dir["#{LIB_PATH}/model/*.rb"].each{|file| require file}
