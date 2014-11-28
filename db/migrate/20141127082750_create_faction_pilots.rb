class CreateFactionPilots < ActiveRecord::Migration
  def change
    create_table :faction_pilots do |t|
      t.integer :faction_id
      t.integer :pilot_id

      t.timestamps
    end

    add_index :faction_pilots, :faction_id
    add_index :faction_pilots, :pilot_id
  end
end
