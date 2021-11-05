# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  before { create(:order) }

  context 'when records in the Order have been created and there is indexing' do
    it 'has the right algorithmic complexity for primary key' do
      expect { described_class.find_by(autoincrement_primary_key: 1) }.to perform_logarithmic.sample(5000).times
    end

    it 'has the right algorithmic complexity for attribute of description' do
      expect { described_class.find_by(description: 'anything') }.to perform_logarithmic.sample(5000).times
    end
  end
end
