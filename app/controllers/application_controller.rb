class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bells_and_pomegranates"
  end

  get '/' do
    erb :index
  end
end
