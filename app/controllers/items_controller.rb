class ItemsController < ApplicationController
  def new
    @product = Categorie.where(id: 14..19)
    @products = Categorie.where(id: 29..31)
    @parent = Categorie.where(id: 1..13)

  end
end
