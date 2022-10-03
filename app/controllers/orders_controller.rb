class OrdersController < ApplicationController
  def index
    if current_user.role == "provider"
      @orders = provider_orders
    else
      @orders = Order.where(user: current_user).order(created_at: :desc)
    end
  end

  private

  def provider_orders
    games = Game.where(user: current_user)
    @orders = []
    games.each do |game|
      game.orders.each { |order| @orders << order }
    end
    return @orders
  end
end
