class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string :imeage_url,           null: false
      t.string :title,                null: false
      t.text :text,                   null: false
      t.integer :condition_id,        null: false
      t.integer :category_id,         null: false
      t.integer :fee_burden,          null: false
      t.integer :area_burden,         null: false
      t.integer :hending_time,        null: false
      t.timestamps
    end
  end
end
