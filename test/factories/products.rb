FactoryBot.define do
  factory :product do
    title { Faker::Game.title }
    price { Faker::Commerce.price }
    genre { Faker::Game.genre }
    platform { Faker::Game.platform }
    image { Faker::Placeholdit.image(size: '300x300',
                                     background_color: Faker::Color.hex_color.delete('#'),
                                     text_color: '000', text: title)}
  end
end
