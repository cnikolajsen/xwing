class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :pilot_name
      t.integer :pilot_skill
      t.text :description
      t.text :card_text
      t.integer :cost
      t.string :image_url
      t.string :ship
      t.integer :primary_weapon
      t.integer :agility
      t.integer :hull
      t.integer :shield
      t.integer :faction_id
      t.integer :expansion_id
      t.string :slug

      t.timestamps
    end
    add_index :ships, :slug, unique: true
    add_index :ships, :faction_id
    add_index :ships, :expansion_id
  end
end
