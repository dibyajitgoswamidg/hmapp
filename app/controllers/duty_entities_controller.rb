class DutyEntitiesController < ApplicationController

  def index
    @duty_entities = DutyEntity.all
  end

  def new
    @duty_entity = DutyEntity.new
  end

  def create
    return if unique_check_entity
    @duty_entity = DutyEntity.new(name: params[:duty_entity][:name])
    if @duty_entity.save
      redirect_to duty_sheets_path, flash: {success: 'New duty entity added successfully.'}
    else
      redirect_to :back
    end
  end

  private

  def unique_check_entity
    if DutyEntity.find_by(name: params[:duty_entity][:name])
      redirect_to duty_sheets_path
    end
  end

end
