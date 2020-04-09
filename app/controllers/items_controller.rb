class ItemsController < ApplicationController
  before_action :set_items,only:[:show, :edit, :destroy, :update]
 
  def new
    @item = Item.new
    @item.item_images.build
    @parent = Category.where(id: 1..13)
    @images=@item.item_images.build
  end
  
  def show
    @item=Item.find(params[:id])
    @category = @item.category
    @children = @category.parent
    @Grandparent = @children.parent
    @parentcategory = @category.parent
    @images = @item.item_images
    @image = @images.first
    # @parentcategory = @categorie.parent
  end

    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:id]}", ancestry: nil).children
  end
    
    # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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

  def update
    if @item.update(item_update_params)
       redirect_to root_path controller: :items
    else
      flash[:alert] = '必須事項を入力してください。'
      redirect_to controller: :items, action: :edit
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

  def item_update_params
    params.require(:item).permit(
    :name,:image,
    [item_images_attributes: [:image_url, :_destroy, :id]])
  end

end