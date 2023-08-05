class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one_attached :image
  def add_tax_price
      (self.price * 1.10).round
  end
end
