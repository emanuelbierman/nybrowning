class BoardsController < ApplicationController

  get '/boards' do
    @boards = Board.all
    erb :'boards/index'
  end

  get '/boards/:id' do
    @board = Board.find_by(id: params[:id])
    erb :'boards/show'
  end

end
