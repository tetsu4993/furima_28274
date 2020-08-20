class Item < ApplicationRecord

  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :area_burden
  belongs_to_active_hash :handing_time

  #空の投稿を保存できないようにする
  validates :image, :title, :text, :price, presence: true 

  #with_options presence: true do #{ other_than: 1, message: "can't be blank"} do
    ##validates :category_id #format: {with: /\A[1-11]+\z/, message: "Select"}
    #validates :condition_id
    #validates :fee_burden_id
    #validates :area_burden_id
    #validates :handing_time_id
  #end

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1, message: "Select"} do
    validates :category_id #format: {with: /\A[1-11]+\z/, message: "Select"}
    validates :condition_id
    validates :fee_burden_id
    validates :area_burden_id
    validates :handing_time_id
  end

  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"Out of setting range"} do
    #validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :price #format: {with: /\A3[0-9][0-9]|{3.7}+\z/, message: "Out of setting range"}
  end

end
