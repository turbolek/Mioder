class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create

  end
  
  def show
    @order = Order.find(params[:id])
  end
  
end
