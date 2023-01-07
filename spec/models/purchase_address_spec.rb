require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it "情報があれば保存ができること" do
      expect(@purchase_address).to be_valid
    end

    it "ビル名が空欄でも保存できること" do
      @purchase_address.building = ''
      expect(@purchase_address).to be_valid
    end

    context '内容に問題がある場合' do
    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase_address.post_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号が3桁ハイフン4桁でないと保存できないこと' do
      @purchase_address.post_code = '12-123'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it '都道府県が空欄では保存できないこと' do
      @purchase_address.prefectures_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '都道府県が---では保存できないこと' do
      @purchase_address.prefectures_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '市町村区が空欄では保存できないこと' do
      @purchase_address.district = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("District can't be blank")
    end

    it '番地が空欄では保存できないこと' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空欄では保存できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が短すぎると保存できないこと' do
      @purchase_address.phone_number = '090'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it '電話番号が長すぎると保存できないこと' do
      @purchase_address.phone_number = '090000000000000000'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it '電話番号は半角数字以外は保存できないこと' do
      @purchase_address.phone_number = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'Userが紐づいていないと登録できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'Itemが紐づいていないと登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
end
end

end