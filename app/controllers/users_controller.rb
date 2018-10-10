class UsersController < ApplicationController

  get '/login' do
    if logged_in?
      redirect "/boards"
    else
      erb :'users/login_signup'
    end
  end

  get '/logout' do
    session.destroy
    flash[:message] = "You have been logged out."
    redirect "/"
  end

  post '/signup' do
    if !params[:user][:username].blank? || !params[:user][:email].blank? || !params[:user][:password].blank?
      if !User.find_by(username: params[:user][:username])
        user = User.new
        user.username = params[:user][:username]
        user.email = params[:user][:email]
        user.password = params[:user][:password]
        session[:user_id] = user.id
        flash[:message] = "Welcome, #{user.username}!"
        redirect "/boards"
      else
        flash[:message] = "This user already exists. Please try again."
        redirect "/login"
      end
      # user = User.where(username: params[:user][:username]).first_or_create do |user|
        # user.email = params[:user][:email]
        # user.password = params[:user][:password]
      # end
    else
      flash[:message] = "Please input a username, email and password. All fields are required."
      redirect "/login"
    end
  end

  post '/login' do
    # refactor this without nested conditionals
    if !params[:user][:username].empty?
      user = User.find_by(:username => params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        flash[:message] = "Welcome, #{user.username}!"
        redirect "/boards"
      else
        flash[:message] = "Please enter your password again."
        redirect "/login"
      end
    else
      flash[:message] = "Please input a username, email and password. All fields are required."
      redirect "/login"
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user.id == @user.id
      erb :'users/show'
    elsif logged_in?
      flash[:message] = "Sorry, you can only view your own account."
      redirect "/login"
    else
      flash[:message] = "Please log in to access your account."
      redirect "/login"
    end
  end

  patch '/users/:id' do
    # include validation here
    @user = User.find_by(id: params[:id])
    @user.update(username: params[:user][:username]) unless params[:user][:username].blank?
    @user.update(email: params[:user][:email]) unless params[:user][:email].blank?
    redirect to "/users/#{@user.id}"
  end

end
