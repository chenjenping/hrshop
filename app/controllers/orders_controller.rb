class OrdersController < ApplicationController
  def index
    @orders = Order.order(:created_at)
  end

  def new
    @order = Order.new
    session[:items] ||= []
    @items = session[:items]
  end

  def create
    @order = Order.new(order_params)
    @items = session[:items]
    if cart_is_empty?
      render 'new' and return
    end

    @items.each do |item|
      @order.order_items << OrderItem.new({ :product_id => item['product_id'], :amount => item['amount'] })
    end

    if @order.save
      session[:items] = []
      redirect_to orders_url
    else
      render 'new'
    end
  end

  def clear_cart
    session[:items] = []
    redirect_to new_order_url
  end

private

  def order_params
    params.require(:order).permit(:purchaser, :phone, :email, :address)
  end

  def cart_is_empty?
    items = session[:items]
    if (items.count == 0)
      return true
    else
      return false
    end
  end
end
