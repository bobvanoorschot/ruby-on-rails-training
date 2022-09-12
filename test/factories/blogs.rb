# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    title { 'Blog title' }
    body { 'MyText' }
  end
end
