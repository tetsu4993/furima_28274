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
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
    validates :email, format: {with: VALID_EMAIL_REGEX}
    validates :email, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]{6,}+\z/
    validates :password, format: {with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :password, length: {minimum: 6, message: "is too short (minimum is 6 characters)"} 
    validates :password_confirmation, format: {with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :password_confirmation, length: {minimum: 6, message: "is too short (minimum is 6 characters)"}
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end

  
end
