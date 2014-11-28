class CreateFactionShips < ActiveRecord::Migration
  def change
    create_table :faction_ships do |t|
      t.integer :faction_id
      t.integer :ship_id

      t.timestamps
    end

    add_index :faction_ships, :faction_id
    add_index :faction_ships, :ship_id
  end
end
