class ItemsController < ApplicationController
  def new
    @item = Item.new
    @product = Categorie.where(id: 14..19)
    @products = Categorie.where(id: 29..31)
    @parent = Categorie.where(id: 1..13)
  end
  
  def show
    @item = Item.find_by(id: params[:id])
    @categorie = Categorie.find_by(id: @item.categorie_id)
  end

end
