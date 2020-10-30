class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def get_all_slots
    @slots = Slot.all.available
    if @slots.present?
      render json: @slots
    else
      render json: {message: "Not Found", status: 302}
    end
  end


  def index
    @appointments = current_user.appointments.all
  	if @appointments.present?
      render json: @appointments
    else
      render json: {message: "Not Found", status: 302}
    end
  end

  def create
    slot = Slot.find_by_id(params['appointment']['slot_id'])
  	if slot.present?
      @appointment = current_user.appointments.new(appointment_params)
    	if @appointment.save
        render json: @appointment
      else
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
