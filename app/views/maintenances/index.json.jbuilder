json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :id, :title, :date, :description, :cost
  json.url maintenance_url(maintenance, format: :json)
end
