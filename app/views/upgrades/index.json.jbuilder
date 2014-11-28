json.array!(@upgrades) do |upgrade|
  json.extract! upgrade, :id, :name, :ability, :attack_value, :weapon_range, :category, :cost, :slug
  json.url upgrade_url(upgrade, format: :json)
end
