json.array!(@squadrons) do |squadron|
  json.extract! squadron, :id, :name, :description, :points, :wins, :draws, :losses, :faction_id, :slug
  json.url squadron_url(squadron, format: :json)
end
