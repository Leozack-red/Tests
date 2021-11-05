# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    order_id { 4 }
    description { 'anything' }
  end
end
