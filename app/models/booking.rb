class Booking < ApplicationRecord

  #resourcify

  belongs_to :meeting_room
  belongs_to :user

  validate :time_slot,:leave_check
  validates :duration, :start_date, :meeting_room_id, presence: true

  private

  def time_slot

  	# self.start_date = Time.parse(self.start_date).strftime '%d/%m/%Y %I:%M %p'
  	date = self.start_date + (self.duration.to_i * 60)
  	self.end_date = date.strftime '%d/%m/%Y %I:%M %p'

  	st_time = self.start_date.strftime '%Y-%m-%d %H:%M:%S'
  	ed_time = self.end_date.strftime '%Y-%m-%d %H:%M:%S'
  	bookings_with_start_date = Booking.where('meeting_room_id = ? and start_date <= ? and end_date >= ?',self.meeting_room_id,st_time,st_time)
    bookings_with_end_date = Booking.where('meeting_room_id = ? and start_date <= ? and end_date >= ?',self.meeting_room_id,ed_time,ed_time)
    if bookings_with_start_date.present? || bookings_with_end_date.present?
    	self.status = 	bookings_with_start_date.last.status.to_i + 1
    else
    	self.status = 0
    end
  end

  def leave_check
    leave_check = LeaveManagement.where("DATE(date) = ?", self.start_date.to_date) 
    if leave_check.present?
        errors.add(:start_date, "can't be booked as this date is a holiday declared.")
    end
  end

end
