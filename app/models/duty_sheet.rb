class DutySheet < ApplicationRecord
  belongs_to :employee
  belongs_to :ward
  belongs_to :duty_entity
end
