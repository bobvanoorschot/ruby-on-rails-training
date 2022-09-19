# frozen_string_literal: true

require 'test_helper'

# Test PaymentService
class PaymentServiceTest < ActiveSupport::TestCase
  test 'set order payment to paid' do
    order = FactoryBot.create(:order, payment_status: :open)

    assert_equal 'open', order.payment_status

    PaymentService.new(order).call

    assert_equal 'paid', order.payment_status
    assert_equal 'Payment success', ActionMailer::Base.deliveries.last.subject
  end
end
