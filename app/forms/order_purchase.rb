class OrderPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :postcode, :city, :block, :building, :phonenumber, :token

  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to_active_hash :area_burden

  with_options presence: true do
    validates :postcode,     format: {with: /\A\d{3}[-]\d{4}\z/, message: ""}
    validates :city,         format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message:""}
    validates :block,        format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message:""}
    validates :phonenumber, format: {with: /\A\d{,11}\z/, message:""}
  end
  with_options numericality: { other_than: 1, message: "Select"} do
    validates :prefecture_id
  end


  def save

    order = Order.create(user_id: user_id, item_id: item_id)

    Purchase.create(order_id: order.id, prefecture_id: prefecture_id, postcode: postcode, city: city, block: block, building: building, phonenumber: phonenumber)

  end

end
