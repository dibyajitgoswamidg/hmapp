class AddGroupReferenceToEmployeeDutySheet < ActiveRecord::Migration[5.2]
  def change
    add_reference :duty_sheets, :group, index: true
    add_reference :duty_sheets, :duty_entity, index: true
  end
end
