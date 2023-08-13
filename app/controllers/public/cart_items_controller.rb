class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if params[:cart_item][:amount] == "0"
      @cart_item.destroy
      redirect_to cart_items_path
    elsif @cart_item.update(amount: params[:cart_item][:amount])
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      #@total_price = current_customer.cart_products.cart_products_total_price(@cart_products)
      render "cart_items/index"
    end
  end

  def destroy

  end

  def destroy_all

  end

  def create
     @cart_item = current_customer.cart_items.new(cart_item_params)
     if current_customer.cart_item.find_by(item_id: params[:carrt_item][:item]).present?
       current_customer.cart_item.find_by(item_id: params[:carrt_item][:item]).number += params[:cart_item][:amount].to_i
       current_customer.cart_item.find_by(item_id: params[:carrt_item][:item]).save
       redirect_to cart_items_path
     elsif  @cart_item.save!
      redirect_to cart_items_path
     end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
