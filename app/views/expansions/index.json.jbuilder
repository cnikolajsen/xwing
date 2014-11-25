json.array!(@expansions) do |expansion|
  json.extract! expansion, :id, :title, :description, :slug
  json.url expansion_url(expansion, format: :json)
end
