json.array!(@cards) do |card|
  json.extract! card, :id
  json.url card_url(card, format: :json)
end
