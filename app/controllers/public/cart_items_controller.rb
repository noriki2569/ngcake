class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  def create
     @cart_item = current_customer.cart_items.new(cart_item_params)
     if @cart_item.save
      redirect_to cart_items_path
     else
      render 'public/items/show'
     end
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
