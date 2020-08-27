require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = build(:purchase)
  end

  describe '商品出品' do
    context '購入がうまくいくとき' do
      # binding.pry
      it "titleやtextなどが存在すれば登録できる" do
        expect(@purchase).to be_valid
      end
    end

    context '新規購入がうまくいかないとき' do
      it "入力フォーム全てに記述がないとダメ" do
        expect(@purchase).to be_valid
      end

      it "postcodeがないとダメ" do
        @purchase.postcode = nil
        @purchase.valid?
        expect(@purchase.errors[:postcode])
      end
  
      it "phonenumberないとダメ" do
        @purchase.phonenumber = nil
        @purchase.valid?
        binding.pry
        expect(@purchase.errors[:phonenumber])
      end
  
      it "cityないとダメ" do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors[:city])
      end
  
      it "blockないとダメ" do
        @purchase.block = nil
        @purchase.valid?
        expect(@purchase.errors[:block])
      end

      it "prefecture_idに１が入力されてるとダメ" do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors[:prefecture_id])
      end

      it "phonenumberにハイフンがあるとダメ" do
        @purchase.phonenumber = '09012345678'
        @purchase.valid?
        expect(@purchase.errors[:phonenumber])
      end

      it "postcodeにハイフンがないとダメ" do
        @purchase.postcode = 123-4567
        @purchase.valid?
        expect(@purchase.errors[:postcode])
      end
    end
  end
end
