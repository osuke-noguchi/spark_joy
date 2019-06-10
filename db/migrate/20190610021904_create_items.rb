class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :brand
      t.text :item_image, null: false
      t.integer :size
      t.string :price
      t.date :purchase_day, null: false
      t.integer :memo, null: false
      t.integer :user_id, foreign_key: true, null: false
      t.integer :category_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
