class ItemsController < ApplicationController
  before_action :set_items,only:[:show,:destroy]
 
  def new
    @item = Item.new
    @item.item_images.build
    @parent = Category.where(id: 1..13)
  end
  
  def show
    @item=Item.find(params[:id])
    @category=@item.category_id
    # @children=@category.parent
    # @Grandparent = @children.parent
    # @parentcategory=@category.parent
    @images = @item.item_images
    @image = @images.first
    # @parentcategory=@categorie.parent
  end

  def  done
    # @product_purchaser= Product.find(params[:id])
    # @product_purchaser.update( purchaser_id: current_user.id)
  end

  def buy
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      # 上記リダイレクト先を修正
    else
      flash.now[:alert] = '必須事項を入力してください。'
      @item = Item.new
      @parent = Category.where(id: 1..13)
      render "new"
    end
  end

  def destroy
    render :delete unless @item.user_id == current_user.id && @item.destroy
    redirect_to root_path, flash: {alert: '削除しました'}
  end

  private


  def set_items
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
            .permit( :name, :text, :category_id, :condition, :brand, :trading_status, :price, :delivery_days, :delivery_area, item_images_attributes: [:image_url]).merge(user_id: current_user.id)
  end

end