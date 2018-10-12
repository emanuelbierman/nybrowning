# require 'rack-flash'

class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    # can I filter posts by created_at?
    erb :'posts/index'
  end

  post '/posts' do
    @board = Board.find_by(id: params[:board][:id])
    if logged_in?
      @post = Post.create(content: params[:post][:content])
      @user = current_user
      @post.user = @user
      @user.posts << @post
      @post.board = @board
      @board.posts << @post
      flash[:message] = "Your post has been posted."
      redirect "/boards/#{@board.id}"
    else
      flash[:message] = "You must be logged in to post."
      redirect "/boards/#{@board.id}"
    end
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    if logged_in?
      @post.update(content: params[:post][:content]) unless params[:post][:content].blank?
      flash[:message] = "Your post has been updated."
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "You must be logged in to edit a post."
      redirect to "/users/#{@user.id}"
    end
  end

  delete '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    if logged_in?
      @post.destroy
      flash[:message] = "Your post has been deleted."
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "You must be logged in to delete a post."
      redirect to "/users/#{@user.id}"
    end
  end
end
