json.array!(@ships) do |ship|
  json.extract! ship, :id, :pilot_name, :pilot_skill, :ship_type, :faction, :primary_weapon_value, :agility, :hull, :shield, :description, :cost, :slug
  json.url ship_url(ship, format: :json)
end
