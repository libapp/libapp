class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms, id: false do |t|
      t.string :number, null: false
      t.integer :size
      t.integer :building
      t.integer :status

      t.timestamps null: false
    end

    add_index :rooms, :number, unique: true
  end
end
