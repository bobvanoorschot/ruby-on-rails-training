# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Faker::Config.locale = :nl

10.times do |i|
  FactoryBot.create(:blog, title: "bc #{i}")
  end

100.times do
  FactoryBot.create(:product)
end

400.times do
  FactoryBot.create(:order, :with_items, status: Faker::Number.within(range: 4..9))
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?