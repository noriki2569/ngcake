class Public::CartItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  def create
     @cart_items = CartItem.new(item_params)
    if @cart_items.save
    end
  end
end
