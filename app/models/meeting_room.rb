class MeetingRoom < ApplicationRecord
  has_many :facility_items, :dependent => :destroy
  has_many :bookings, :dependent => :destroy

  validates :name, :floor_no, presence: true

end
