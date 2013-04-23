require 'sinatra/base'
require 'model/age_group'
require 'model/fives_team'
require 'model/user'
require 'model/summary'
require 'model/mailing_target'

class FivesController < Sinatra::Base

  before('/fgfc/*') do
    @default_layout = :layout_fgfc
  end

  get '/fgfc/add_item' do

    erb :'fgfc/add_news_item'
  end






end