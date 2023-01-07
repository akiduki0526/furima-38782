require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    purchase = FactoryBot.create(:purchase)
    @shipping_address = FactoryBot.build(:shipping_address, purchase_id: purchase.id)
  end

  context '内容に問題ない場合' do
    it "情報があれば保存ができること" do
      expect(@shipping_address).to be_valid
    end
  end

end
