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
     @cart_item= current_customer.cart_items.new(cart_item_params)
     @item = Item.find(params[:item_id])
     @cart_items.item_id = @item.id
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
