class SellController < ApplicationController
  def index
    @items = Item.all
    @images = ItemImage.all
  end

  def new
  end
end
