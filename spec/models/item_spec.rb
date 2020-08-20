require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = build(:item)
    @item.image = fixture_file_upload("/files/609090330.951538.jpeg")
  end

  describe '商品出品' do
    context '新規出品がうまくいくとき' do
      #binding.pry
      it "titleやtextなどが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      #binding.pry
      it "priceが300〜999999999であれば登録できる" do
        @item.price = 888888
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it "入力フォーム全てに記述がないとダメ" do
        expect(@item).to be_valid
      end

      it "imageがないとダメ" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
  
      it "titleないとダメ" do
        @item.title = nil
        @item.valid?
        expect(@item.errors[:title]).to include("can't be blank")
      end
  
      it "textないとダメ" do
        @item.text = nil
        @item.valid?
        expect(@item.errors[:text]).to include("can't be blank")
      end
  
      it "priceないとダメ" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end
  
      it "priceが300〜999999999でないとダメ" do
        @item.price = 200
        @item.valid?
        #binding.pry
        expect(@item.errors[:price]).to include("Out of setting range")
      end
  
      #it "category_idないとダメ" do
        #@item.category_id = nil
        #@item.valid?
        #expect(@item.errors[:category_id]).to include("can't be blank")
      #end
    
      #it "condition_idがないとダメ" do
        #@item.condition_id = nil
        #@item.valid?
        #expect(@item.errors[:condition_id]).to include("can't be blank")
      #end
  
      #it "area_burdenがないとダメ" do
        #@item.area_burden_id = nil
        #@item.valid?
        #expect(@item.errors[:area_burden_id]).to include("can't be blank")
      #end
  
      #it "fee_burdenがないとダメ" do
        #@item.fee_burden_id = nil
        #@item.valid?
        #expect(@item.errors[:fee_burden_id]).to include("can't be blank")
      #end
  
      #it "handing_timeがないとダメ" do
        #@item.handing_time_id = nil
        #@item.valid?
        #expect(@item.errors[:handing_time_id]).to include("can't be blank")
      #end
  
      it "category_idに１が入力されてるとダメ" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("Select")
      end
    
      it "condition_idに１が入力されてるとダメ" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include("Select")
      end

      it "areaburden_idに１が入力されてるとダメ" do
        @item.area_burden_id = 1
        @item.valid?
        expect(@item.errors[:area_burden_id]).to include("Select")
      end

      it "fee_burden_idに１が入力されてるとダメ" do
        @item.fee_burden_id = 1
        @item.valid?
        expect(@item.errors[:fee_burden_id]).to include("Select")
      end

      it "handing_time_idに１が入力されてるとダメ" do
        @item.handing_time_id = 1
        @item.valid?
        expect(@item.errors[:handing_time_id]).to include("Select")
      end
    end
  end
end
