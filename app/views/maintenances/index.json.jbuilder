json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :id, :title, :date, :description, :cost
  json.url car_maintenance_url([maintenance.car, maintenance], format: :json)
end
