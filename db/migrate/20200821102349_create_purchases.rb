class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :order,                null: false, foreign_key: true
      t.integer :prefecture_id,           null: false
      t.string :postcode,                 null: false
      t.string :city,                     null: false
      t.string :block,                    null: false
      t.string :building
      t.string :phonenumber,              null: false
      t.timestamps
    end
  end
end