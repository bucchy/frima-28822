class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :street_address,         null: false
      t.string  :phone_number,           null: false
      t.string  :postal_code,            null: false
      t.integer :prefectures,           null: false
      t.string  :city,                   null: false
      t.string  :building_name,
      t.integer :purchase_id,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
