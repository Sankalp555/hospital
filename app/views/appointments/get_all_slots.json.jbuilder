json.slots @slots do |slot|
  json.extract! slot, :id, :slot_type
  json.doctor_name slot.doctor.full_name
  json.start_time slot.start_time.strftime("%Y-%m-%d %R")
  json.end_time slot.end_time.strftime("%Y-%m-%d %R")

end