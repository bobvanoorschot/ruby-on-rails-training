# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  status     :integer          default("concept"), not null
#
class Blog < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    enum status: { concept: 0, published: 1, archived: 2 }
end
