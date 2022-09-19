# frozen_string_literal: true

class ImportService


  # Complete payment for order
  def call
    400.times do
    FactoryBot.create(:order, :with_items, status: Faker::Number.within(range: 4..9))
    end
  end
end
