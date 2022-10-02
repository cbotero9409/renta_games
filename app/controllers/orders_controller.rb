class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: :desc)
  end
end
