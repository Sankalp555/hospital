class SlotsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @slots = current_user.slots.all
  	if @slots.present?
      render json: @slots
    else
      render json: {message: "Not Found", status: 302}
    end
  end

  def create
  	@slot = current_user.slots.new(slot_params)
  	if @slot.save
      render json: @slot
    else
      render json: {message: @slot.errors.full_messages[0], status: 302}
    end
  end


  def slot_params
    params.require(:slot).permit(:start_time, :end_time, :availability, :date, :slot_type)
  end


end
