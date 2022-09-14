class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.payment_success.subject
  #
  def payment_success(order)
    @order = order

    mail to: order.email, subject: "Payment success" 
  end
end
