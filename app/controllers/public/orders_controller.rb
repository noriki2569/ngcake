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
    @postage = 800
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.unit_price = cart_item.item.tax_price
      order_detail.quantity = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @order = current_customer.orders
    @cart_item = current_customer.cart_items.all
  end

  def show  
  end

  private

  def order_params
     params.require(:order).permit(:postage, :payment_method, :name, :address, :postal_code ,:total_payment)
  end
end
