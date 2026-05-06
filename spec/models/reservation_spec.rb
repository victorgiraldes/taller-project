require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { should belong_to(:book) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, reserved: 1) }
  end
end
