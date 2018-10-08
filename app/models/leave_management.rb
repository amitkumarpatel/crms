class LeaveManagement < ApplicationRecord
  validates :holiday_name, :date, presence: true
end
