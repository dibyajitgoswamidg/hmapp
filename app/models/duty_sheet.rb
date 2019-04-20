class DutySheet < ApplicationRecord
  belongs_to :employee
  belongs_to :ward
end
