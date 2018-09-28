class BoardsController < ApplicationController

  get '/boards' do
    # anyone can see an index of boards
    @boards = Board.all
    erb :'boards/index'
  end

  # get '/boards/new' do
  #   users can't create new boards, or can they?
  # end

  get '/boards/:id' do
    # anyone can see all posts in a board
    @board = Board.find_by(id: params[:id])
    erb :'boards/show'
  end

  # get '/boards/edit' do
  #   users can't edit boards, or can they?
  # end
end
