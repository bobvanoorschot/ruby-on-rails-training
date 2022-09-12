# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { concept: 0, published: 1, archived: 2 }
end
