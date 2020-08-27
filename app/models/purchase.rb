class Purchase < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  #with_options presence: true do
    #validates :postcode,     format: {with: /\A\d{3}[-]\d{4}\z/, message: ""}
    #validates :city,         format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message:""}
    #validates :block,        format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message:""}
    #validates :phone_number, format: {with: /\A\d{,11}\z/, message:""}
  #end
  #with_options numericality: { other_than: 1, message: "Select"} do
    #validates :area_burden_id
  #end

end