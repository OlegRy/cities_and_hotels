class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.string :type

      t.timestamps
    end
  end
end
