json.array!(@cats) do |cat|
  json.extract! cat, :id, :name, :breed, :image_url, :description
  json.url cat_url(cat, format: :json)
end
