class Product < ApplicationRecord
  has_one_attached :background_image

  validates :price, :title, :genre, :platform, presence: true
end
