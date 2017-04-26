json.array!(@cars) do |car|
  json.extract! car, :id, :Make, :Model, :Cost, :Description, :vin
  json.url car_url(car, format: :json)
end
