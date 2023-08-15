class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_item = current_customer.cart_items.all
  end

  def complete

  end

  def create

  end

  def index
  end

  def show
  end

  private

  def order_params
     params.require(:order).permit(:postage, :payment_method, :name, :address, :post_code ,:customer_id,:total_payment)
  end
end
