class CreatePatientRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_registrations do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :contact_number, unique: true
      t.string :address_line
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :email, unique: true
      t.string :govt_id_type
      t.string :govt_id
      t.timestamps
    end
  end
end
