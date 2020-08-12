class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname, format: {with: //, message: ""}
    validates :birthday, format: {with: //, message: ""}
    validates :email, format: {with: //, message:""}
    validates :email, uniqueness: true
    validates :password, format: {with: /\A[a-zA-Z0-9]+\z/, message: "include both letters and numbers"}
    validates :password, length: { minimum: 1, message: "is too short (minimum is 6 characters)" } 
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end

  
end
