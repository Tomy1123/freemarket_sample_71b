class ItemsController < ApplicationController
  def new
    @item = Item.new
    @product = Categorie.where(id: 14..19)
    @products = Categorie.where(id: 29..31)
    @parent = Categorie.where(id: 1..13)
  end
  
  def show
    @item = Item.find_by(params[:id])
    @categorie = @item.name
    # @parentcategory=@categorie.parent
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      # redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def item_params
    params.require(:item)
            .permit( :name, :text, :category_id, :brand, :condition, :trading_status, :trading_status, :delivery_days, :price,  )
  end

end