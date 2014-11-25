json.array!(@pilots) do |pilot|
  json.extract! pilot, :id, :name, :skill, :description, :card_text, :slug
  json.url pilot_url(pilot, format: :json)
end
