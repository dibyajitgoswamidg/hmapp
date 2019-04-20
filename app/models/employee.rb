class Employee < ApplicationRecord
  belongs_to :employee_type
  has_many :duty_sheets
end
