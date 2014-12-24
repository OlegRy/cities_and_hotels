json.array!(@bookings) do |booking|
  json.extract! booking, :id, :user_name, :date_start, :date_end
  json.url booking_url(booking, format: :json)
end
