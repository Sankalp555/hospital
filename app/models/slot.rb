class Slot < ApplicationRecord

  belongs_to :doctor

  validates :start_time, uniqueness: { scope: :date, message: "Already assigned!" }
  scope :available, -> { where(availability: true) }

end
