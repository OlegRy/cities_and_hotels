class AddRoomIDtoBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :room_id, :integer, default: nil
  end
end
