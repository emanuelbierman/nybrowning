# require 'rack-flash'

class PostsController < ApplicationController

  # posts don't need their own views because they're only viewable in the context of the message board

  post '/posts' do
    # this @board needs to be passed whether or not the user is logged in
    @board = Board.find_by(id: params[:board][:id])
    if logged_in?
      @post = Post.create(content: params[:post][:content])
      @user = current_user
      @post.user = @user
      @user.posts << @post
      @post.board = @board
      @board.posts << @post
    #   flash[:message] = "Your post was submitted."
    # else
    #   flash[:message] = "Your post was not submitted."
    end
    redirect to "/boards/#{@board.id}"
  end

  post '/posts/:id' do
    # users can edit the content of their own posts
    @post = Post.find_by(id: params[:id])
    @post.update(content: params[:post][:content]) unless params[:post][:content].blank?
  end
end
