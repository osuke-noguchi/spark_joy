class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.integer :brand, null: false
      t.timestamps
    end
  end
end
