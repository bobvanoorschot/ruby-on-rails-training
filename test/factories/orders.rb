# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  email          :string           not null
#  address        :string           not null
#  zipcode        :string           not null
#  city           :string           not null
#  phone          :string           not null
#  status         :integer          default(0), not null
#  payment_status :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :order do
    first_name { 'MyString' }
    last_name { 'MyString' }
    email { 'MyString' }
    address { 'MyString' }
    zipcode { 'MyString' }
    city { 'MyString' }
    phone { 'MyString' }
    status { 1 }
    payment_status { 1 }
  end
end
