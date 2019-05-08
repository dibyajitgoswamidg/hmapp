class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @employee_types = EmployeeType.all
    @employees = Employee.all
    @groups = Group.all
    @employee_type = EmployeeType.new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, flash: {success: 'New employee added successfully.'}
    else
      redirect_to :back
    end
  end

  def edit
    @employee_types = EmployeeType.all
    @groups = Group.all
    @employee = Employee.find(params[:id])
  end

  def update
    @employee= Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  private

  def unique_check
    if Employee.find_by(contact_number: params[:employee][:contact_number]).present? || Employee.find_by(email: params[:employee][:email]).present?
      redirect_to employee_index_path
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :contact_number,
                                     :alternate_contact_number, :email, :address_line,
                                     :city, :state, :country, :pincode, :employee_type_id,
                                     :gender, :govt_id, :govt_id_type, :group_id)
  end
end
