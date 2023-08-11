class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def sub_price
    (self.price * amount * 1.10).round
  end
end
