class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
    #@item = 
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
      flash[:notice] = '出品に失敗しました'
      render 'new'
    end
  end

  #def tax
    #item = Item.find(params[:id])
    #tax = item_params(price) * 0.1
  #end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :price, :category_id, :condition_id, :fee_burden_id, :area_burden_id, :handing_time_id).merge(user_id: current_user.id)
  end
end
