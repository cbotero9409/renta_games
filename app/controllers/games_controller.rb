class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update create_order]

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
    @order = Order.new
    @collection = [7, 15, 30, 60, 90, 180]
  end

  def user_games
    @user = User.find(params[:id])
    @games = @user.games
    @title = @user.name || @user.email
  end

  def create_order
    @order = Order.new(order_params)
    @order.game = @game
    @order.user = current_user
    if @order.save
      redirect_to game_path(@game)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :available, :photo, :description)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:days)
  end
end
