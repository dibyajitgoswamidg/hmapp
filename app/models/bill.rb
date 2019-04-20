class Bill < ApplicationRecord
  belongs_to :patient_entry
  belongs_to :billing_entity
end
