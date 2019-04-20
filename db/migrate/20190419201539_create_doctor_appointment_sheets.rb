class CreateDoctorAppointmentSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_appointment_sheets do |t|

      t.date :appointment_date
      t.time :appointment_time
      t.string :status
      t.references :patient_entry
      t.timestamps
    end
  end
end
