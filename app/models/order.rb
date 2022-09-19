# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :delete_all

  accepts_nested_attributes_for :order_items, allow_destroy: true


  enum status: { name_step: 0, address_step: 2, payment_step: 3, new_order: 4, sent: 5, completed: 6, returned: 7,
                 awaiting_payment: 8, collecting: 9 }
  enum payment_status: { not_started: 0, open: 1, pending: 2, paid: 3, rejected: 4 }

  before_validation :defaults, on: :create

  validates :first_name, :last_name, :email, presence: true
  validates :address, :zipcode, :city, presence: true, unless: :name_step?
  validates :email, email: true, uniqueness: { message: 'must be unique' }


  def name
    "#{first_name} #{last_name}"
  end

  def defaults
    self.address ||= ''
    self.city ||= ''
    self.zipcode ||= ''
  end

  def consent; end
end
