class CreateDutySheets < ActiveRecord::Migration[5.2]
  def change
    create_table :duty_sheets do |t|

      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :employee
      t.references :ward
      t.timestamps
    end
  end
end
