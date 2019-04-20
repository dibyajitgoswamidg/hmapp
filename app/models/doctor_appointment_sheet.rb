class DoctorAppointmentSheet < ApplicationRecord
  has_many :patient_entries
end
