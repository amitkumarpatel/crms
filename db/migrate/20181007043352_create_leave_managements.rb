class CreateLeaveManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_managements do |t|
      t.string :holiday_name
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end
end
