require 'sinatra/base'
# require 'sinatra/activerecord'
# require 'active_record'
require 'model/age_group'
require 'model/fives_team'
require 'model/user'
require 'model/summary'
require 'tilt'
require 'pony'

class SendMailError < StandardError
end

class FivesController < Sinatra::Base
  @@confirmation_template = Tilt.new("#{File.dirname(__FILE__)}/email_templates/confirmation.erb")

  get '/' do
    erb :login
  end

  get '/register' do
    @age_groups = AgeGroup.where(:open => true)
    erb :register
  end

  post '/add_another' do
    @age_groups = AgeGroup.where(:open => true)
    if params[:id]
      fives_team = FivesTeam.find(params[:id].to_i)
      @fives_team = fives_team unless fives_team.nil?
    end
    erb :register_form, :layout => false
  end

  post '/registered' do
    begin
      @fives_team = FivesTeam.create(
          :age_group_id => params[:age_group_id],
          :team_name => params[:team_name],
          :team_designation => params[:team_designation],
          :league_name => params[:league],
          :league_division => params[:division],
          :manager_name => params[:manager_name],
          :mobile_phone => params[:mobile_phone],
          :home_phone => params[:home_phone],
          :email_address => params[:email_address],
          :address_line1 => params[:address_line1],
          :address_line2 => params[:address_line2],
          :address_town => params[:address_town],
          :address_county => params[:address_county],
          :address_postcode => params[:address_postcode],
          :date_registered => Time.now
      )
      @age_group = AgeGroup.find(params[:age_group_id].to_i)
      # send_confirmation_mail(@fives_team, @age_group)
      send_confirmation_mail(@fives_team, @age_group) unless ENV['DATABASE_URL'] == 'localhost'
      erb :registered, :layout => false
    rescue SendMailError => ex
      puts "error registering new team problem sending mail #{ex.message}"
      @send_mail_error = true
      erb :registered, :layout => false
    rescue Exception => ex
      puts "error registering new team #{ex.message}"
      erb :register, :layout => false
    end

  end

  helpers do
    def fives_year
      year = Date.today.year
      fives_year = (Date.today.month > 8 ? year + 1 : year)
      fives_year
    end

    def season
      year = Date.today.year
      season_year =  Date.today.month < 8 ? year - 1 : year
      "#{season_year}/#{season_year + 1}"
    end


    def discount_applicable
      #todo make work
      false
    end

    def has_errors
      false
    end

    def applications_closed
      false
    end

    def applications_closing
      $closing_date
      false
    end

    def any_age_groups_closed?
      AgeGroup.where(:open => false)
    end

    def age_groups_closed
      (AgeGroup.where(:open => false).collect {|age_group| age_group.description}).join(', ')
    end

    def send_confirmation_mail fives_team, age_group
      begin
        mail_text = @@confirmation_template.render(nil, {:fives_team => fives_team, :age_group => age_group, :discount_applicable => discount_applicable})
        Pony.mail(
            :from => 'forest glade fives' + "<fg5s@forestgladefc.co.uk>",
            :to => fives_team.email_address,
            :subject => "The Forest Glade Fives - Application Confirmation - Your Reference: " + fives_team.ref_id,
            :html_body => mail_text,
            :via => :smtp,
            :via_options => {
                :address => 'smtp.gmail.com',
                :port => '587',
                :enable_starttls_auto => true,
                :user_name => 'fg5s@forestgladefc.co.uk',
                :password => 'f0restg!ade5s',
                :authentication => :plain,
                :domain => 'localhost.localdomain'
            })
      rescue => ex
        raise SendMailError.new (ex.message)
      end
    end

  end

  require_relative 'routes/admin'
  require_relative 'routes/fgfc_admin'
  require_relative 'routes/error'
end
