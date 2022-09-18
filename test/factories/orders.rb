# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| Faker::Internet.safe_email(name: "#{first_name} #{n}") }
    address { Faker::Address.street_address }
    zipcode { Faker::Address.zip_code }
    city { Faker::Address.city }
    status { :name_step }
    payment_status { Faker::Number.within(range: 1..4) }
    created_at { Faker::Time.between_dates(from: 6.months.ago, to: Date.today, period: :day) }
    updated_at { Faker::Time.between_dates(from: created_at, to: Date.today) }

    transient do
      items_count { Faker::Number.within(range: 1..10) }
    end

    trait :with_items do
      after(:create) do |order, evaluator|
        FactoryBot.create_list(:order_item, evaluator.items_count, order: order)
      end
    end
  end
end
