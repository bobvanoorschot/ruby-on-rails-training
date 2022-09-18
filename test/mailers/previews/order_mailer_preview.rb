# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/payment_success
  def payment_success
    order = FactoryBot.build(:order)

    OrderMailer.payment_success(order)
  end
end
