# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    department_id { 15 }
    description { 'anything' }
  end
end
