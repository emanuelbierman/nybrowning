class UsersController < ApplicationController

  get '/users' do
    # users can't see all users
  end

  get '/users/login' do
    # users can log in or go to the board index
    if logged_in?
      erb :'/boards'
    else
      erb :'users/login_signup'
    end
  end

  get '/users/new' do
    # users can sign up
    redirect to '/users/login'
  end

  get '/users/:id' do
    # users can only see their own profile, and no one else's
    @user = User.find(params[:id]) unless !@user
    if logged_in? && current_user == @user
      erb :'users/show'
    else
      redirect to '/boards'
    end
  end

  patch '/users/:id' do
    # users can update their own information
    @user = User.find(params[:id])
    @user.update(username: params[:user][:username]) unless params[:user][:username].blank?
    @user.update(email: params[:user][:email]) unless params[:user][:email].blank?
  end

  post '/users/new' do
    # after a user signs up, they go to the boards index
    @user = User.create(params[:user])
    redirect to '/boards'
  end

  delete '/users/:id' do
    # users can delete their own account, and no one else's
    @user = User.find(params[:id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
