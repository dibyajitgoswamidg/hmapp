class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|

      t.string :name
      t.string :qty
      t.date :start_date
      t.date :end_date
      t.string :routine
      t.references :patient_entry
      t.timestamps
    end
  end
end
