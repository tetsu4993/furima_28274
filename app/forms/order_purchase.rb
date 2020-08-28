class OrderPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :postcode, :city, :block, :building, :phonenumber, :token

  with_options presence: true do
    validates :postcode,     format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city,         format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :block,        format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :phonenumber,  format: {with: /\A\d{,11}\z/}
    # validates :token,        format: {with: //}
    # validates :number,       format: {with: /A\d{,16}\z/}
    # validates :cvc,          format: {with: /A\d{,4}\z/}
    # validates :exp_month,    format: {with: /A\d{,2}\z/}
    # validates :exp_year,     format: {with: /A\d{,2}\z/}
  end
  with_options numericality: { other_than: 1, message: "Select"} do
    validates :prefecture_id
  end


  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(order_id: order.id, prefecture_id: prefecture_id, postcode: postcode, city: city, block: block, building: building, phonenumber: phonenumber)

  end

end
