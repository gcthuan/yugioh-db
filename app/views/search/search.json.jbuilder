json.array!(@results) do |result|
	if result.itype == 'card'
		json.extract! result, :id, :name, :slug, :itype, :card_image, :created_at, :updated_at
	else
		json.extract! result, :id, :name, :slug, :itype, :set_image, :created_at, :updated_at
	end
end