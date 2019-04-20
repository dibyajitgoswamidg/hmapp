class PatientEntry < ApplicationRecord
  has_many :bills
  has_many :medicines
  has_many :test_reports
  belongs_to :department
  belongs_to :patient_registration
  belongs_to :patient_registration_type
  belongs_to :doctor_appointment_sheet
end
