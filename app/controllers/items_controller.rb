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

  def buy
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
  end

  def show
    @item=Item.find(params[:id])
    @category=@item.category
    @children=@category.parent
    @parentcategory=@category.parent
    @images = @item.item_images
    @image = @images.first
    # @comment = Comment.new
    # @comments = @product.comments.includes(:user)
  end

  private


  def set_items
    @item = Item.find(params[:id])

  end

  def item_params
    params.require(:item)
            .permit( :name, :text, :category_id, :brand, :condition, :trading_status, :trading_status, :delivery_days, :price,  )
  end

end