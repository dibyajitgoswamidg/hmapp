class EmployeeController < ApplicationController
  before_action :authenticate_user!

  def index
    @employee_types = EmployeeType.all
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @employee_type = EmployeeType.new
  end

  def create
    check_type_or_employee
  end

  def edit

  end

  private

  def create_employee_type
    @employee = EmployeeType.new(employee_type_params)
    if @employee.save
      redirect_to employee_index_path, flash: {success: 'New employee type added successfully.'}
    else
      redirect_to :back
    end
  end

  def create_employee
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employee_index_path, flash: {success: 'New employee added successfully.'}
    else
      redirect_to :back
    end
  end

  def check_type_or_employee
    if (params["/employee"][:name]).present?
      return if unique_check_type
      create_employee_type
    else
      return if unique_check
      create_employee
    end
  end

  def unique_check
    if Employee.find_by(contact_number: params["/employee"][:contact_number]).present? || Employee.find_by(email: params["/employee"][:email]).present?
      redirect_to employee_index_path
    end
  end

  def unique_check_type
    if EmployeeType.find_by(name: params["/employee"][:name]).present?
      redirect_to employee_index_path
    end
  end

  def employee_type_params
    params.require("/employee").permit(:name)
  end

  def employee_params
    params.require("/employee").permit(:first_name, :last_name, :contact_number, :alternate_contact_number, :email, :address_line, :city, :state, :country, :pincode, :employee_type_id)
  end
end
