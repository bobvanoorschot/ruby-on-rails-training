ActiveAdmin.register Order do
  actions :all, except: :destroy




  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :address, :zipcode, :city, :status, :payment_status, :email, order_items_attributes: [:amount, :price, :product_id, :_destroy, :id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :address, :zipcode, :city, :status, :payment_status, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :status, as: :select, collection: Order.statuses

  action_item :update_payment_status, only: %i[show] do
    link_to 'Update payment status', update_payment_status_admin_order_path(order), method: :post unless order.paid?
  end

  member_action :update_payment_status, method: :post do
    order = Order.find(params[:id])
    
    PaymentService.new(order).call

    redirect_to admin_order_path(order)
  end


  collection_action :delete_all_orders, method: :delete do
    Order.includes(:order_items).destroy_all

    redirect_to admin_orders_path, notice: 'Alles is weg!'
  end

  action_item :delete_all_orders, only: %i[index] do
    link_to 'Verwijder alle orders', delete_all_orders_admin_orders_path, method: :delete, data: { confirm: 'Sure?' }
  end

  collection_action :import_orders, method: :post do
    ImportService.new.call

    redirect_to admin_orders_path, notice: 'Nieuwe Orders!'
  end

  action_item :import_orders, only: %i[index] do
    link_to 'Import', import_orders_admin_orders_path, method: :post if Rails.env.development?
  end

  index do
    selectable_column
    id_column
    column :name
    tag_column :status
    tag_column :payment_status
    actions
  end

  show do
    render 'show', { order: order }
  end

  form do |f|
    f.inputs
    f.inputs do 
      f.has_many :order_items, allow_destroy: true do |oi|
        oi.input :product
        oi.input :amount
        oi.input :price
      end
    end
    f.actions
  end
end
