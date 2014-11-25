class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :factions, :slug, unique: true
  end
end
