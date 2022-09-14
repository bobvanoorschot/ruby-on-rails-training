# frozen_string_literal: true

require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test 'payment_success' do
    order = FactoryBot.create(:order)
    mail = OrderMailer.payment_success(order)
    assert_equal 'Payment success', mail.subject
    assert_equal [order.email], mail.to
  end
end
