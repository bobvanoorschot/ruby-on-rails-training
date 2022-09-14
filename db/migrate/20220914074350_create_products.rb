class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, precision: 18, scale: 2
      t.string :genre, null: false
      t.string :platform, null: false

      t.timestamps
    end
  end
end
