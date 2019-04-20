class CreatePatientRegistrationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_registration_types do |t|
      
      t.string :name
      t.timestamps
    end
  end
end
