class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @count=0
  end
end
