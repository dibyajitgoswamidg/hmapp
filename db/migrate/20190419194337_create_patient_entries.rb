class CreatePatientEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_entries do |t|

      t.string :description
      t.string :doctor
      t.references :patient_registration
      t.references :department
      t.references :patient_registration_type
      t.timestamps
    end
  end
end
