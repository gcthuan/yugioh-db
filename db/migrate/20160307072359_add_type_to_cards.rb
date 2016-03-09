class AddTypeToCards < ActiveRecord::Migration
  def change
    add_column :cards, :itype, :string, default: 'card'
  end
end
