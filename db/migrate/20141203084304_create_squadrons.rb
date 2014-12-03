class CreateSquadrons < ActiveRecord::Migration
  def change
    create_table :squadrons do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :faction_id
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
    add_index :squadrons, :user_id
    add_index :squadrons, :faction_id
    add_index :squadrons, :slug, unique: true
  end
end
