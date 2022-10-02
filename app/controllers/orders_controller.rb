class OrdersController < ApplicationController
  def index
    if current_user.role == "provider"
      @orders = supplier_orders
    else
      @orders = Order.all.order(created_at: :desc)
    end
  end

  private

  def supplier_orders
    games = Game.where(user: current_user)
    @orders = []
    games.each do |game|
      game.orders.each { |order| @orders << order }
    end
    return @orders
  end
end
