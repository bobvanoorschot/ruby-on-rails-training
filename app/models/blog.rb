# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :background_image

  enum status: { concept: 0, published: 1, archived: 2 }
end
