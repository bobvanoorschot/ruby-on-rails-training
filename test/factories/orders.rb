# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    first_name { 'MyString' }
    last_name { 'MyString' }
    sequence(:email) { |n| "person#{n}@example.com" }
    address { 'MyString' }
    zipcode { 'MyString' }
    city { 'MyString' }
    status { :name_step }
    payment_status { :open }
  end
end
