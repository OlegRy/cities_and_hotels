class ChangeBookingDateFieldFormat < ActiveRecord::Migration
  def change
    change_column :bookings, :date_start, :date
    change_column :bookings, :date_end, :date
  end
end
