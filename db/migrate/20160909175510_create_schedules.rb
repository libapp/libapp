class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :member_id
      t.string :room_number
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status

      t.timestamps null: false
    end
  end
end
