FactoryBot.define do
  factory :order_item do
    order
    product
    amount { Faker::Number.within(range: 1..6) }
    price { product.price }
    sub_total { amount * price }
  end
end
