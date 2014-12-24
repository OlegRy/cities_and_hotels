json.array!(@rooms) do |room|
  json.extract! room, :id, :hotel_id, :type
  json.url room_url(room, format: :json)
end
