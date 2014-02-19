json.array!(@adopted_pets) do |adopted_pet|
  json.extract! adopted_pet, :id, :pet_id, :selection_id
  json.url adopted_pet_url(adopted_pet, format: :json)
end
