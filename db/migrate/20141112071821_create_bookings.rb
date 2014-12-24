class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :user_name
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
