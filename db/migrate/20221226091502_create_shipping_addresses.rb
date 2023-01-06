class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :post_code,   null: false
      t.integer    :prefectures_id,    null: false
      t.string     :district,          null: false
      t.string     :address,           null: false
      t.string     :building
      t.string     :phone_number

      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
