# require 'rack-flash'

class PostsController < ApplicationController

  # posts don't need their own views because they're only viewable in the context of the message board

  post '/posts' do
    # users can create a new post if they've already signed up and logged in
    if logged_in? && current_user
    # do I need both of these conditions?
      @post = Post.create(params[:post])
      @user = current_user
      @board = Board.find_by(params[:board])
      @post.user = @user
      @user.posts << @post
      @post.board = @board
      @board.posts << @post
    #   flash[:message] = "Your post was submitted."
    # else
    #   flash[:message] = "Your post was not submitted."
    end
    redirect to '/boards'
  end

  patch '/posts/:id' do
    # users can edit the content of their own posts
    @post = Post.find_by(params[:id])
    @post.update(content: params[:post][:content]) unless params[:post][:content].blank?
  end
end
