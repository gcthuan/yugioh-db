json.array!(@cards) do |card|
  json.extract! card, :id, :name, :slug, :card_image, :data, :impressions_count
  json.url card_url(card, format: :json)
end
