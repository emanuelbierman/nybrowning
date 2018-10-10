# require 'rack-flash'

class PostsController < ApplicationController

  post '/posts' do
    # include validation here
    @board = Board.find_by(id: params[:board][:id])
    @post = Post.create(content: params[:post][:content])
    @user = current_user
    @post.user = @user
    # @user.posts << @post
    @post.board = @board
    # @board.posts << @post
    flash[:message] = "Your post has been posted."
    redirect "/boards/#{@board.id}"
  end

  patch '/posts/:id' do
    # include validation here
    @post = Post.find_by(id: params[:id])
    @post.update(content: params[:post][:content]) unless params[:post][:content].blank?
    @user = @post.user
    flash[:message] = "Your post has been updated."
    redirect to "/users/#{@post.user.id}"
  end

  delete '/posts/:id' do
    # include validation here
    @post = Post.find_by(id: params[:id])
    user_id = @post.user.id
    @post.destroy
    flash[:message] = "Your post has been deleted."
    redirect to "/users/#{user_id}"
  end
end
