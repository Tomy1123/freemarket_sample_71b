class ItemsController < ApplicationController
  def new
    @product = Categorie.where(id: 14..19)
    @parent = Categorie.where(id: 1..13)

  end
end
