class PurchasesController < ApplicationController
  #before_action :item_params, only:[:index]

  def index
    @item = Item.find(params[:item_id])
    #@purchase = OrderPurchase.find(purchase_params[:item_id])
  end

  def new
    @purchase = OrderPurchase.new
  end

  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @purchase = OrderPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end



  private

  #def order_params
    #params.require(:purchase).permit(:order_id)
  #end

  #def item_params
    #params.require(:item).permit(:image, :title, :text, :price, :category_id, :condition_id, :fee_burden_id, :area_burden_id, :handing_time_id)
  #end

  def purchase_params
    #binding.pry
    params.permit(:item_id, :prefecture_id, :postcode, :city, :block, :building, :phonenumber, :token).merge(user_id: current_user.id)
  end

  #def card_params
    #params.permit(:token)
  #end

  def pay_item
    Payjp.api_key = "sk_test_d4ec331a941a55f76c5b853b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
