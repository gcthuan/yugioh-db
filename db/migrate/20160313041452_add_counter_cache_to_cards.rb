class AddCounterCacheToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :impressions_count, :integer, default: 0
  end
end
