class Blog < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    after_save :doe_iets

    enum status: { concept: 0, published: 1, archived: 2 }
end
