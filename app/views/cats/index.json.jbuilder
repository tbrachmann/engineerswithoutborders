json.array!(@cats) do |cat|
  json.extract! cat, :id, :name, :age, :colour
  json.url cat_url(cat, format: :json)
end
