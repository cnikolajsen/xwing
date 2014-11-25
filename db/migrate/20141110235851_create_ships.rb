class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :ship_type
      t.integer :primary_weapon
      t.integer :agility
      t.integer :hull
      t.integer :shield
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :ships, :slug, unique: true
  end
end
