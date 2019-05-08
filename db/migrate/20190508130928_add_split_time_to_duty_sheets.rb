class AddSplitTimeToDutySheets < ActiveRecord::Migration[5.2]
  def change
    add_column :duty_sheets, :start_time_split, :time
    add_column :duty_sheets, :end_time_split, :time
  end
end
