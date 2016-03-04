class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
    	t.string :name, null: false, unique: true
    	t.string :slug, unique: true
    	t.jsonb :data
    	t.string :set_image
      t.timestamps null: false
    end

    add_index :card_sets, :name, unique: true
    add_index :card_sets, :slug, unique: true
  end
end
