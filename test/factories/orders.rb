FactoryBot.define do
  factory :order do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    status { 1 }
    payment_status { 1 }
  end
end
