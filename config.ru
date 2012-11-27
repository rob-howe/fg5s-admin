$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib') unless $LOAD_PATH.include?(File.dirname(__FILE__) + '/lib')
require "fives_controller"

require 'active_record'
require 'mysql2'

puts "ENV['DATABASE_URL']=#{ENV['DATABASE_URL']}"

ENV['DATABASE_URL'] = 'localhost' if ENV['DATABASE_URL'].nil?
ENV['USER_NAME'] = 'root' if ENV['USER_NAME'].nil?
ENV['PASSWORD'] = 'password' if ENV['PASSWORD'].nil?
ENV['SCHEMA'] = 'forest_glade' if ENV['SCHEMA'].nil?

ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:host => ENV['DATABASE_URL'],
:username => ENV['USER_NAME'],
:password => ENV['PASSWORD'],
:database => ENV['SCHEMA'],
:reconnect => true
)

#$age_groups = AgeGroup.find(:all)
#$user = User.find(:all)
year = Date.today.year
$saturday_date = '25'
$sunday_date = '26'
$year =  Date.today.month > 8 ? year + 1 : year
$season = "#{year}/#{year +1}"

$closing_date = 'Friday 4th May 2012'
$discount_end_date = 'Friday 4th May 2012'

run FivesController

#   heroku_d700529ea100691
#
#Username:	bd0887a8404bd6
#Password:	c0ec2ec7
# shema heroku_d700529ea100691
# mysql2://bd0887a8404bd6:c0ec2ec7@us-cdbr-east-02.cleardb.com/heroku_d700529ea100691?reconnect=true