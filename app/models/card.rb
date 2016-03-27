require 'elasticsearch/model'
class Card < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	validates :name, presence: true, uniqueness: true
	is_impressionable :counter_cache => true
	has_many :comments, dependent: :destroy

	#send requests to yugiohprices API and pull the data to our database
	def self.initialize_card_db
		begin
			http = HTTP.persistent "http://yugiohprices.com"
			CardSet.all.each do |card_set|
			card_set["data"]["cards"].each do |card|
				#escape forward slash
				card_name = card["name"].gsub(/\//, "%2F")
				card_data = JSON.parse(http.get("/api/card_data/#{card_name}").to_s)
				card_versions = JSON.parse(http.get("/api/card_versions/#{card_name}").to_s)
				#flush to read off the body of the request so we can make another request
				card_image = http.get("/api/card_image/#{card_name}").flush["Location"]
				Card.where(name: card["name"]).first_or_create(name: card["name"], data: card_data["data"], card_image: card_image, card_versions: card_versions["data"])
			end
		end
		ensure
			http.close if http
		end
		
	end

end

# Card.__elasticsearch__.create_index! force: true
# Card.import