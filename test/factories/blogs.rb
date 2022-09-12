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
FactoryBot.define do
  factory :blog do
    title { 'Blog title' }
    body { "MyText" }
  end
end
