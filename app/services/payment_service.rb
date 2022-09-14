class PaymentService
    attr_reader :order
    
    def initialize(order)
        @order = order
    end

    # Complete payment for order
    def call
        order.payment_status = :paid
        order.save

        # Send email if status is paid
        OrderMailer.payment_success(order).deliver_now
    end
end