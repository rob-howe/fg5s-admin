require 'sinatra/base'
require 'model/age_group'
require 'model/fives_team'
require 'model/user'
require 'model/summary'
require 'model/mailing_target'

class FivesController < Sinatra::Base

  before '/admin/*' do
    redirect('/') unless session[:user]
  end

  enable :sessions

  get '/login' do
    erb :login
  end

  post '/authenticate' do
    user = User.where(login: params[:login], password: params[:password])
    if user
      session[:user] = user
      session[:user_name] = user.name
      redirect('/admin/summary')
    else
      @message = "Sorry, the details you have provided seem to be incorrect. Please try again."
      erb :login
    end

  end

  get '/admin/summary' do
    @summary = Summary.select(:id, :age_group, :total, :paid, :unpaid)
    erb :'admin/summary'
  end

  get '/admin/age_group' do
    @fives_teams = FivesTeam.where(age_group_id: params[:age_group_id].to_i) unless params[:age_group_id].nil?
    @age_group = AgeGroup.find(params[:age_group_id].to_i)
    erb :'admin/age_group_list'
  end

  get '/admin/excel' do
    @fives_teams = FivesTeam.order(:age_group_id)
    content_type 'application/vnd.ms-excel'
    erb :excel, :layout => false
  end

  post '/admin/edit' do
    @fives_team = FivesTeam.find(params[:id].to_i)
    @age_groups = AgeGroup.all
    erb :'admin/edit_team'
  end

  get '/admin/find' do
    @fives_team = FivesTeam.find(params[:ref_id].to_i)
    @age_group = AgeGroup.find(@fives_team.age_group_id)
    erb :'admin/show_team'

  end
  post '/admin/find' do
    @fives_team = FivesTeam.find(params[:ref_id].to_i)
    @age_group = AgeGroup.find(@fives_team.age_group_id)
    erb :'admin/show_team'
  end

  post '/admin/update' do
    @fives_team = FivesTeam.find(params[:id].to_i)

    @fives_team.age_group_id = params[:age_group_id]
    @fives_team.team_name = params[:team_name]
    @fives_team.team_designation = params[:team_designation]
    @fives_team.league_name = params[:league]
    @fives_team.league_division = params[:division]
    @fives_team.paid = !params[:paid].nil?
    @fives_team.paypal = !params[:paypal].nil?
    @fives_team.manager_name = params[:manager_name]
    @fives_team.mobile_phone = params[:mobile_phone]
    @fives_team.home_phone = params[:home_phone]
    @fives_team.email_address = params[:email_address]
    @fives_team.address_line1 = params[:address_line1]
    @fives_team.address_line2 = params[:address_line2]
    @fives_team.address_town = params[:address_town]
    @fives_team.address_county = params[:address_county]
    @fives_team.address_postcode = params[:address_postcode]

    @fives_team.save
    @age_group = AgeGroup.find(@fives_team.age_group_id)
    erb :'admin/show_team'
  end

  post '/admin/add_team' do
    @age_groups = AgeGroup.all
    erb :'admin/add_team'
  end

  post '/admin/save' do
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
    erb :'admin/show_team'
  end

  get '/admin/upload' do
    erb :'admin/upload'
  end

  post '/admin/upload' do
    unless params[:file] &&  (tmpfile = params[:file][:tempfile]) && (name = params[:file][:filename])
        @error = "No file selected"
        erb :'admin/upload'
      end
    @duplicate_emails = []
    @invalid_format_emails = []
    emails_line = params[:file][:tempfile].read
    emails = emails_line.split(/\n/)
    emails.uniq.each do |email|
        if email =~ /^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/
          begin
            MailingTarget.create(:email_address => email, :opted_out => false)
            puts "good email #{email}"
          rescue ActiveRecord::RecordNotUnique => ex
            @duplicate_emails << email
          end

        else
          @invalid_format_emails << email
        end
    end

    erb :'admin/upload'

  end
end