require './config/environment'
# require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "bells_and_pomegranates"
  end

  get '/' do
    erb :index
  end

  get '/contact' do
    erb :contact
  end

  get '/meetings' do
    # @events = Event.all
    erb :meetings
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
