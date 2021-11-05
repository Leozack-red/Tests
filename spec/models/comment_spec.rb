# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { create(:comment) }

  context 'when records in the Comment have been created and there is indexing' do
    it 'has the right algorithmic complexity for primary key' do
      expect { described_class.find_by(order_id: 4) }.to perform_constant.sample(5000).times
    end
  end
end
