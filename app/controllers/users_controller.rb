class UsersController < ApplicationController

  get '/login' do
    if logged_in?
      erb :'/boards'
    else
      erb :'users/login_signup'
    end
  end

  get '/logout' do
    session.destroy
    @message = "You have been logged out."
    erb :index
  end

  post '/signup' do
    if params[:user][:username].blank? || params[:user][:email].blank? || params[:user][:password].blank?
      user = User.where(username: params[:user][:username]).first_or_create do |user|
        user.email = params[:user][:email]
        user.password = params[:user][:password]
      end
      session[:user_id] = user.id
      erb :'boards/show'
    else
      @message = "Please input a username, email and password. All fields are required."
      erb :'users/login_signup'
    end
  end

  post '/login' do
    if !params[:user][:username].empty?
      user = User.find_by(:username => params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect to '/boards'
      else
        @message = "Please try again."
        erb :'users/login_signup'
      end
    else
      @message = "Please input a username, email and password. All fields are required."
      erb :'users/login_signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user.id == @user.id
      erb :'users/show'
    elsif logged_in?
      @message = "Sorry, you can only view your own account."
      erb :'users/login_signup'
    else
      @message = "Please log in to access your account."
      erb :'users/login_signup'
    end
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])
    @user.update(username: params[:user][:username]) unless params[:user][:username].blank?
    @user.update(email: params[:user][:email]) unless params[:user][:email].blank?
    redirect to "/users/#{@user.id}"
  end

end
