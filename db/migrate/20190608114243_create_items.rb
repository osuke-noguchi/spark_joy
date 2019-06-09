class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :item_image, null: false
      t.string :size, null: false
      t.integer :price, null: false
      t.integer :purchase_day, null: false
      t.string :memo, null: false
      t.integer :user, foreign_key: true, null: false
      t.integer :category_id, foreign_key: true, null: false, index: true
      t.integer :brand_id, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
