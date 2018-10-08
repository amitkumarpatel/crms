class CreateFacilityItems < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_items do |t|
      t.string :facility_name
      t.integer :available_quantity
      t.integer :meeting_room_id

      t.timestamps
    end
  end
end
