class AddTypeToCardSets < ActiveRecord::Migration
  def change
    add_column :card_sets, :itype, :string, default: 'set'
  end
end
