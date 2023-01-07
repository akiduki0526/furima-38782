class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, 
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
             format: { with: /\A[0-9]+\z/}
  validates :condition_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectures_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :estimated_shipping_date_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :user, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :purchase

  belongs_to :category
  has_one_attached :image
  belongs_to :shipping_charge
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :estimated_shipping_date

end
