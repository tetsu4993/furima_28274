require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、birthdayとfamily_name、first_nameとfamily_name_kana、first_name_kanaが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a0a0a0"
        @user.password_confirmation = "a0a0a0"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "入力フォーム全てに記述がないとダメ" do
        expect(@user).to be_valid
      end
  
      it "ニックネームないとダメ" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
  
      it "メルアドないとダメ" do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
  
      it "family_nameないとダメ" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
  
      it "first_nameないとダメ" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
  
      it "birthdayないとダメ" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
    
      it "first_nameのカタカナがないとダメ" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end
  
      it "family_nameのカタカナがないとダメ" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("can't be blank")
      end
  
      it "パスワードないとダメ" do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
  
      it "パスワードはあるけど、確認用パスワードがないとダメ" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end
  
      it "重複したメルアドはダメ" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    
      it "パスワードが５文字以下ではダメ " do
        @user.password = "a0a0a"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it "パスワードが英数混合でないとダメ " do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors[:password]).to include("Include both letters and numbers")
      end
    end
  end

  describe '#katakana' do
    it 'first_name_kanaがカタカナで返ること' do
      @user.first_name_kana = "kana"
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("Full-width katakana characters")
    end

    it 'family_name_kanaがカタカナで返ること' do
      @user.family_name_kana = "kana"
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("Full-width katakana characters")
    end
  end
end