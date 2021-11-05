# frozen_string_literal: true

class Order < ApplicationRecord
  validates :department_id, presence: true
  validates :description, presence: true
  self.primary_key = 'autoincrement_primary_key'
end
