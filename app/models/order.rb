class Order < ApplicationRecord
  enum status: { name_step: 0, address_step: 2, payment_step: 4 }

  before_validation :defaults, on: :create
  
  validates :first_name, :last_name, :email, presence: true
  validates :address, :zipcode, :city, presence: true, unless: :name_step?
  validates :email, email: true, uniqueness: { message: 'must be unique' }
  
  def defaults
    self.address = ''
    self.city = ''
    self.zipcode = ''
  end

  def consent
  end

end
