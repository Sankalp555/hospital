require 'rails_helper'

RSpec.describe Slot, type: :model do

  describe 'associations' do
    it { should belong_to(:doctor) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
  end

end