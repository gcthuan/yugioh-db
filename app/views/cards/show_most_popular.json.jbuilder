json.array!(@cards) do |card|
	json.extract! card, :id, :name, :slug, :impressions_count, :card_image, :data, :card_versions, :created_at, :updated_at
end