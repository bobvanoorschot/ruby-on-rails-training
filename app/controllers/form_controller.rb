class FormController < ApplicationController
  before_action :session_order, only: %i[address_submit payment_submit]
  
  def name_step
    ## Get name and create order
    @order = Order.new

  end

  def name_submit
    @order = Order.new(order_params)

    if @order.save
      session[:order] = @order.id
      redirect_to form_address_step_path
    else
      render :name_step, status: :unprocessable_entity
    end
  end

  def address_step
    ## Retrieve existing order and add address
    return redirect_to form_name_step_path unless session[:order]
    session_order
  end

  def address_submit
    @order.status = :address_step

    if @order.update(order_params)
      redirect_to form_payment_step_path
    else
      render :address_step, status: :unprocessable_entity
    end
  end

  def payment_step
    ## Retrieve order and update payment status
    return redirect_to form_name_step_path unless session[:order]
    
    session_order
  end

  def payment_submit
    @order.status = :payment_step

# debugger
    if @order.update(order_params) && params[:order][:consent].to_i == 1
      redirect_to form_success_step_path
    else
      render :payment_step, status: :unprocessable_entity
    end
  end

  def success_step

  end

  # Only allow a list of trusted parameters through. / Voorkomt SQL injectie
  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :zipcode, :city)
  end

  def session_order
    @order = Order.find(session[:order])
  end
end
