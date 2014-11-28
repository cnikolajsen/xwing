class CreateUpgrades < ActiveRecord::Migration
  def change
    create_table :upgrades do |t|
      t.string :name
      t.text :ability
      t.integer :attack_value
      t.string :weapon_range
      t.string :category
      t.integer :cost
      t.string :image_url
      t.string :expansion_id
      t.string :slug

      t.timestamps
    end
    add_index :upgrades, :slug, unique: true
    add_index :upgrades, :expansion_id
  end
end
