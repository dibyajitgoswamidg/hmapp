class Ward < ApplicationRecord
  belongs_to :ward_type
  has_many :duty_sheets
end
