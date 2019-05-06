class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :employee_type
      t.references :shift
      t.timestamps
    end
  end
end
