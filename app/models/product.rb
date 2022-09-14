class Product < ApplicationRecord
  validates :price, :title, :genre, :platform, presence: true
end
