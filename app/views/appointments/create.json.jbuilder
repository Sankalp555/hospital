json.extract! @appointment, :id, :appointment_date  
json.doctor_name @appointment.slot.doctor.full_name
json.start_time @appointment.slot.start_time.strftime("%Y-%m-%d %R")
json.end_time @appointment.slot.end_time.strftime("%Y-%m-%d %R")
