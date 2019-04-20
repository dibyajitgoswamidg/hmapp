class PatientRegistrationType < ApplicationRecord
  has_many :patient_entries
end
