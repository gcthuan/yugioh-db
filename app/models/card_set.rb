require 'elasticsearch/model'
class CardSet < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	validates :name, presence: true, uniqueness: true

	#send requests to yugiohprices API and pull data to our database
	def self.initialize_set_db
		begin
			http = HTTP.persistent "http://yugiohprices.com"
			all_card_sets = http.get("/api/card_sets").to_s
			#remove some characters to make the response become a legit array
			card_set_array =  all_card_sets.gsub(/[\"\[\]"]/, "").split(",")
			#get cards in each set
			card_set_array.each do |set_name|
				puts "Running #{set_name}"
				#escape forward slash
				set_name = set_name.gsub(/\//, "%2F")
				set_data = http.get("/api/set_data/#{set_name}").to_s
				#flush to read off the body of the request so we can make another request
				set_image_response = http.get("/api/set_image/#{set_name}").flush
				if set_data.empty?
					puts "Empty"
				else
					set_data = JSON.parse(set_data)
					set_image = set_image_response["Location"]
					CardSet.where(name: set_name).first_or_create(name: set_name, data: { rarities: set_data["data"]["rarities"], cards: set_data["data"]["cards"] }, set_image: set_image)
				end
			end
		ensure
			http.close if http
		end
		
	end
end

CardSet.__elasticsearch__.create_index! force: true
CardSet.import
