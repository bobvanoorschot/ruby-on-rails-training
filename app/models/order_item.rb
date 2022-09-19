class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :recalc

  delegate :title, to: :product
  alias_attribute :recalc, :recalculate

  def recalculate
    self.sub_total = amount.to_f * price.to_f
  end
end
