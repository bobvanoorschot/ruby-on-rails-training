class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :zipcode, null: false
      t.string :city, null: false
      t.integer :status, null: false, default: 0
      t.integer :payment_status, null: false, default: 0

      t.timestamps
    end
  end
end
