class EmployeeTypesController < ApplicationController
  def index
    @employee_types = EmployeeType.all
  end

  def new
    @employee_type = EmployeeType.new
  end

  def create
    return if unique_check_entity
    @employee_type = EmployeeType.new(name: params[:employee_type][:name])
    if @employee_type.save
      redirect_to employees_path, flash: {success: 'New employee type added successfully.'}
    else
      redirect_to :back
    end
  end

  private

  def unique_check_entity
    if EmployeeType.find_by(name: params[:employee_type][:name])
      redirect_to employees_path
    end
  end
end
