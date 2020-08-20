class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      # t.string :image_tag,            null: false
      t.string :title,                null: false
      t.text :text,                   null: false
      t.integer :condition_id,        null: false
      t.integer :category_id,   null: false, foreign_key: true
      t.integer :fee_burden_id,          null: false
      t.integer :area_burden_id,         null: false
      t.integer :handing_time_id,        null: false
      t.integer :price,               null: false
      t.timestamps
    end
  end
end
