class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string :name
      t.integer :skill
      t.text :description
      t.text :card_text
      t.string :slug

      t.timestamps
    end
    add_index :pilots, :slug, unique: true
  end
end
