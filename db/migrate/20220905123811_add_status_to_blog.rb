# frozen_string_literal: true

class AddStatusToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :status, :integer, default: 0, null: false
  end
end
