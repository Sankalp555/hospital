class Appointment < ApplicationRecord

	belongs_to :patient
	belongs_to :slot

  validates :slot_id, uniqueness: { scope: :appointment_date, message: "Already booked" }
  validates :slot_id, :appointment_date, presence: true
end
