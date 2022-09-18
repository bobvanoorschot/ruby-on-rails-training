class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :amount, default: 1
      t.decimal :price, precision: 18, scale: 2
      t.decimal :sub_total, precision: 18, scale: 2
    end
  end
end
