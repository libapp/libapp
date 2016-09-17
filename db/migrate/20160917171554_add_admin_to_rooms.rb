class AddAdminToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :admin, :string
  end
end