class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name, null: false, unique: true
    	t.string :slug, unique: true
    	t.jsonb :data
    	t.jsonb :card_versions
    	t.string :card_image
      t.timestamps null: false
    end

    add_index :cards, :name, unique: true
    add_index :cards, :slug, unique: true
  end
end
