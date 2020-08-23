class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC") 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      flash[:notice] = '出品に失敗しました。'
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.valid? 
      item.destroy
      redirect_to root_path
    else
      flash[:notice] = '商品削除に失敗しました。'
      render 'show'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.valid?
      item.update(item_params)
      redirect_to root_path
    else
      flash[:notice] = '商品情報の更新に失敗しました。'
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :price, :category_id, :condition_id, :fee_burden_id, :area_burden_id, :handing_time_id).merge(user_id: current_user.id)
  end
end
