class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :district, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, 
               format: { with: /\A[0-9]+\z/},
               length: {minimum:10,maximum:11}
    validates :district
    validates :address
    validates :token, presence: true

  end
    validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}


    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      ShippingAddress.create(post_code: post_code, prefectures_id: prefectures_id, district: district, address: address, 
                             building: building, phone_number: phone_number, purchase_id: purchase.id)
    end

end