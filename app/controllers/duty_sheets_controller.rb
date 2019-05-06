class DutySheetsController < ApplicationController

  def index
    @duty_entities = DutyEntity.all
    @duty_sheets = DutySheet.all
    @shifts = Shift.all
    @groups = Group.all
    @employee_types = EmployeeType.all
    @duty_entity = DutyEntity.new
    @shift = Shift.new
    @group = Group.new
  end

  def create
    return if unique_check_sheet
    @duty = DutySheet.new(duty_sheet_params)
    if @duty.save
      redirect_to duty_sheets_path, flash: {success: 'New duty sheet added successfully.'}
    else
      redirect_to :back
    end
  end

  private

  def unique_check_sheet
    if DutySheet.find_by(date: params[:duty_sheet][:date], employee_id: params[:duty_sheet][:employee_id])
      redirect_to duty_sheets_path
    end
  end

  def duty_sheet_params
    params.require(:duty_sheet).permit(:date, :start_time, :end_time, :employee_id, :ward_id)
  end
end
