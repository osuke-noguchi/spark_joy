class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :brand
      t.text :image_id, null: false
      t.string :size
      t.integer :price, :default => 0
      t.date :purchase_day, null: false
      t.string :memo
      t.integer :user_id, foreign_key: true, null: false
      t.integer :category_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
