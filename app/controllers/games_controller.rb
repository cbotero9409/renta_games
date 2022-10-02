class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update create_order]

  def index
    @games = Game.all.order(created_at: :desc)
    @unavailable = []
    @available = []
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
    if @game.orders.empty?
      @order = Order.new
      @collection = [7, 15, 30, 60, 90, 180]
      @available = true
    else
      @available = game_available(@game.orders)
    end
  end

  def user_games
    @user = User.find(params[:id])
    @games = @user.games.order(created_at: :desc)
    @title = @user.name || @user.email
  end

  def create_order
    @order = Order.new(order_params)
    @order.game = @game
    @order.user = current_user
    if @order.save
      redirect_to orders_path
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

  def game_available(orders)
    orders.each do |order|
      start = order.created_at
      endd = start + (order.days * 86_400)
      diff = ((endd - start) / 86_400).floor
      return diff if endd >= Time.now
    end
    return true
  end

end
