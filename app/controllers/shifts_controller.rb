class ShiftsController < ApplicationController

  def index
    @shifts = Shifts.all
  end

  def new
    @shift = Shift.new
  end

  def create
    return if unique_check_shift
    @shift = Shift.new(duty_shift_params)
    if @shift.save
      redirect_to duty_sheets_path, flash: {success: 'New duty sheet added successfully.'}
    else
      redirect_to :back
    end
  end

  private

  def unique_check_shift
    if Shift.find_by(start_time: params[:shift][:start_time], end_time: params[:shift][:end_time], split: params[:shift][:split], split_hour: params[:shift][:split_hour], split_start: params[:shift][:split_start])
      redirect_to duty_sheets_path
    end
  end

  def duty_shift_params
    params.require(:shift).permit(:name, :start_time, :end_time, :split, :split_hour, :split_start)
  end
end
