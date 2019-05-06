class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.boolean :split
      t.integer :split_hour
      t.timestamps
    end
  end
end
