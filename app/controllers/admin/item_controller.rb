class Admin::ItemController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
end