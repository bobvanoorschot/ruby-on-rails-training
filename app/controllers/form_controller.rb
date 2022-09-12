# frozen_string_literal: true

class FormController < ApplicationController
  # Create first step in order page
  def first_step
    @order = Order.new
  end

  # Check if email is unique
  def submit_first
    @order = Order.new(order_params)
    @order.second_step!

    session[:order_form] = @order

    redirect_to action: :second_step
  end

  # Check if address is submitted
  def second_step
    @order = session[:order_form]
  end

  def submit_second; end

  def third_step; end

  def submit_third; end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email)
  end
end
