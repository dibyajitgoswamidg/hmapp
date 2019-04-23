class DepartmentController < ApplicationController
  before_action :authenticate_user!

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    return if unique_check
    @department = Department.new(department_params)
    if @department.save
      redirect_to department_index_path, flash: {success: 'New department added successfully.'}
    else
      redirect_to :back
    end
  end

  def edit

  end

  private

  def unique_check
    if Department.find_by(name: params["/department"][:name]).present?
      redirect_to department_index_path
    end
  end

  def department_params
    params.require("/department").permit(:name)
  end
end
