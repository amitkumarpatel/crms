class FacilityItem < ApplicationRecord

  belongs_to :meeting_room
  
  validates :facility_name, :avalable_quantity,:meeting_room_id, presence: true
end
