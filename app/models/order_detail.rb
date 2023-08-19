class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  def subtotal
    unit_price * quantity
  end
end