json.array!(@factions) do |faction|
  json.extract! faction, :id, :name, :slug
  json.url faction_url(faction, format: :json)
end
