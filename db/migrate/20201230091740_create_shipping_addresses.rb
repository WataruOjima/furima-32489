class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :zip_code,            null: false
      t.integer :prefecture_id,       null: false
      t.string  :city,                null: false
      t.string  :address,             null: false
      t.string  :building
      t.string  :tel_number,          null: false
      t.integer :purchase_record_id,  null: false,foreign_key: true
      t.timestamps
    end
  end
end
