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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
