json.array!(@comments) do |comment|
	json.extract! comment, :author, :body, :votes
end