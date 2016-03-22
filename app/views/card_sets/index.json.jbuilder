json.array!(@card_sets) do |card_set|
  json.extract! card_set, :id, :name, :slug, :set_image, :impressions_count
  
  json.url card_set_url(card_set, format: :json)
end
