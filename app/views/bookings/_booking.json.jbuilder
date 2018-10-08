json.extract! booking, :id, :meeting_rooms, :user_id, :start_date, :duration, :created_at, :updated_at
json.url booking_url(booking, format: :json)
