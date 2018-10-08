class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :meeting_room_id
      t.integer :user_id
      t.datetime :start_date
      t.integer :duration
      t.integer :status
      t.datetime :end_date

      t.timestamps
    end
  end
end
