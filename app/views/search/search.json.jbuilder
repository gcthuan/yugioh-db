json.array!(@results) do |result|
	json.extract! result, :id, :name, :slug, :itype, :created_at, :updated_at
end