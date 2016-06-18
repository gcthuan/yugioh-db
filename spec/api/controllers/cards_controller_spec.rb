require "rails_helper"

RSpec.describe CardsController, type: :controller do
	render_views
	
	describe "GET #index" do
		before(:each) do
			get :index, format: :json
		end
		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "has at most 20 items per page" do
			response_body = JSON.parse(response.body)
			expect(response_body.length).to be <= 20
		end
	end

	describe "GET #show" do
		before(:each) do
			@card = FactoryGirl.create :card
			get :show, id: @card.slug, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "returns the correct card" do
			response_body = JSON.parse(response.body)
			expect(response_body["name"]).to eq(@card.name)
		end
	end

	describe "GET #show_most_popular" do
		before(:each) do
			@card_1 = FactoryGirl.create(:card, name: "Card 1", slug: "card-1", impressions_count: 1)
			@card_2 = FactoryGirl.create(:card, name: "Card 2", slug: "card-2", impressions_count: 2)
			@card_3 = FactoryGirl.create(:card, name: "Card 3", slug: "card-3", impressions_count: 10)
			get :show_most_popular, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "returns the most popular cards" do
			response_body = JSON.parse(response.body)
			expect(response_body[0]["name"]).to eq(@card_3.name)
		end
	end

	describe "GET a random card using #random_one" do
		before(:each) do
			@card_1 = FactoryGirl.create(:card, name: "Card 1", slug: "card-1", impressions_count: 1)
			@card_2 = FactoryGirl.create(:card, name: "Card 2", slug: "card-2", impressions_count: 2)
			@card_3 = FactoryGirl.create(:card, name: "Card 3", slug: "card-3", impressions_count: 10)
			get :random_one, format: :json
		end

		it "response successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "is a card in the collection" do
			response_body = JSON.parse(response.body)
			expect(response_body["itype"]).to eq("card")
		end
	end

end