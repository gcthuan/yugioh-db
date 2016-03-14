class AddCounterCacheToCardSets < ActiveRecord::Migration
  def change
  	add_column :card_sets, :impressions_count, :integer, default: 0
  end
end
