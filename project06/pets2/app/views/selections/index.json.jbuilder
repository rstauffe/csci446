json.array!(@selections) do |selection|
  json.extract! selection, :id
  json.url selection_url(selection, format: :json)
end
