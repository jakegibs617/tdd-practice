class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :title, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.text :description
      t.string :price_range

      t.timestamps
    end
    add_index :bars, [:title], unique: true
  end
end
