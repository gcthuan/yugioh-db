json.array!(@card_sets) do |card_set|
	json.extract! card_set, :id, :name, :slug, :impressions_count, :set_image, :data, :created_at, :updated_at
end