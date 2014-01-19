json.array!(@refuels) do |refuel|
  json.extract! refuel, :id, :miles, :gallons, :price, :car_id
  json.url refuel_url(refuel, format: :json)
end
