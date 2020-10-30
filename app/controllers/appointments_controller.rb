class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def get_all_slots
    @slots = Slot.all.available
    if @slots.blank?
      render json: {message: "Not Found", status: 302}
    end
  end

  def index
    if params["doctor_id"].present?
      doctor = Doctor.find_by_id(params["doctor_id"])
      if doctor.present?
        @appointments = current_user.appointments.where(slot_id: doctor.slots.pluck(:id))
      else
        render json: {message: "Not Found", status: 302}
      end
    else
      @appointments = current_user.appointments.all
  	end
    if @appointments.blank?
      render json: {message: "Not Found", status: 302}
    end
  end

  def create
    slot = Slot.find_by_id(params['appointment']['slot_id'])
  	if slot.present?
      @appointment = current_user.appointments.new(appointment_params)
    	if !@appointment.save
        render json: {message: @appointment.errors.full_messages[0], status: 302}
      end
    else
      render json: {message: "Slot is not present.", status: 302}
    end
  end


  def appointment_params
    params.require(:appointment).permit(:slot_id, :appointment_date)
  end


end
