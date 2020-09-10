class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = OrderPurchase.new
  end

  def create
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


  def purchase_params
    params.permit(:item_id, :prefecture_id, :postcode, :city, :block, :building, :phonenumber, :token).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = "sk_test_d4ec331a941a55f76c5b853b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency:'jpy'                 
    )
  end

end
