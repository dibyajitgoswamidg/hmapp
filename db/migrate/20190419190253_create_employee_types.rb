class CreateEmployeeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_types do |t|
      
      t.string :name
      t.timestamps
    end
  end
end
