FactoryGirl.define do
	factory :card do
		name "Card Name"
		slug "card-name"
		card_image "link"
	end

	factory :card_set do
		name "Set Name"
		slug "set-name"
		set_image "link"
	end

end