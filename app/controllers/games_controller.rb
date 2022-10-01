class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show

  end

  private

  def game_params
    params.require(:game).permit(:name, :available, :photo, :description)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
