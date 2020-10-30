require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe 'associations' do
    it { should belong_to(:patient) }
  end

  describe 'validations' do
  	it { should validate_presence_of(:slot_id) }
    it { should validate_presence_of(:appointment_date) }
  end

end