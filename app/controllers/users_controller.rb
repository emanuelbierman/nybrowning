class UsersController < ApplicationController

  get '/login' do
    # users can log in
    if logged_in?
      erb :'/boards'
    else
      erb :'users/login_signup'
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/'
  end

  post '/signup' do
    # after a user signs up, they go to the boards index
    # @user = User.find_or_create_by(username: params[:user][:username])
    user = User.where(username: params[:user][:username]).first_or_create do |user|
      user.email = params[:user][:email]
      user.password = params[:user][:password]
    end
    session[:user_id] = user.id
    redirect to '/boards'
  end

  post '/login' do
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    end
    redirect to '/boards'
  end

  get '/users/:id' do
    # users can only see their own profile, and no one else's
    @user = User.find_by(id: params[:id]) unless !@user
    if logged_in? && current_user == @user
      erb :'users/show'
    else
      redirect to '/boards'
    end
  end

  patch '/users/:id' do
    # users can update their own information
    @user = User.find_by(id: params[:id])
    @user.update(username: params[:user][:username]) unless params[:user][:username].blank?
    @user.update(email: params[:user][:email]) unless params[:user][:email].blank?
  end

  delete '/users/:id' do
    # users can delete their own account, and no one else's
    @user = User.find_by(id: params[:id])
  end

end
