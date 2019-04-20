class Department < ApplicationRecord
  has_many :patient_entries
end
