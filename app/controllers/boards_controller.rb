class BoardsController < ApplicationController

  get '/boards' do
    @boards = Board.all
    erb :'boards/index'
  end

  get '/boards/new' do
    # users can't create new boards
  end

  get '/boards/:id' do
    @board = Board.find_by(params[:id])
    erb :'boards/show'
  end

  get '/boards/edit' do
    # users can't edit boards
  end
end
