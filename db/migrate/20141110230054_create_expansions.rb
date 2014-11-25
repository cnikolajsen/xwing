class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :expansions, :slug, unique: true
  end
end
