class GroupsController < ApplicationController

  def index
    @groups = Groups.all
  end

  def new
    @group = Group.new
  end

  def create
    return if unique_check_group
    @group = Group.new(group_params)
    if @group.save
      redirect_to duty_sheets_path, flash: {success: 'New group added successfully.'}
    else
      redirect_to :back
    end
  end

  def update
    @group = Group.find(params[:id])
    @group = Group.update(group_params)
    redirect_to duty_sheets_path, flash: {success: 'New group added successfully.'}
  end

  private

  def unique_check_group
    if Group.find_by(name: params[:group][:name], start_date: params[:group][:start_date], end_date: params[:group][:end_date], employee_type_id: params[:group][:employee_type_id], shift_id: params[:group][:shift_id])
      redirect_to duty_sheets_path
    end
  end

  def group_params
    params.require(:group).permit(:name, :start_date, :end_date, :employee_type_id, :shift_id)
  end

end
