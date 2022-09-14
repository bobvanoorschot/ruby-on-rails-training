FactoryBot.define do
  factory :product do
    title { Faker::Game.title }
    price { Faker::Commerce.price }
    genre { Faker::Game.genre }
    platform { Faker::Game.platform }
  end
end
