json.array!(@card_sets) do |card_set|
  json.extract! card_set, :id
  json.url card_set_url(card_set, format: :json)
end
