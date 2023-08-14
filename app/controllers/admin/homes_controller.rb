class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    @count=0
  end
end
