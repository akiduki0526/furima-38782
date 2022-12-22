require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品' do
  context '商品登録できるとき' do
    it '全ての項目が入力されていれば登録できる' do
      expect(@item).to be_valid
    end
    end

  context '商品登録できないとき' do

    it 'imageが空では登録できない' do
      @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
        end

    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    
    it '商品説明が空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

    it 'カテゴリーが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

    it '商品状態が空では登録できない' do
       @item.condition_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Condition can't be blank")
       end
  
    it '配送料負担情報が空では登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
 
    it '発送元が空では登録できない' do
      @item.prefectures_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
  
    it '発送日が空では登録できない' do
      @item.estimated_shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end

    it '価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    
     it '価格は、¥300未満だと登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
  
     it '¥9,999,999より高いと登録できない' do
       @item.price = '10000000'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
       end
   
      it '価格は全角だと登録できない' do
       @item.price = "３００"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
       end
 
       it '価格は数字以外だと登録できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end

      end
  end
end