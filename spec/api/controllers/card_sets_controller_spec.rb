require "rails_helper"

RSpec.describe CardSetsController, type: :controller do
	render_views

	describe "GET #index" do
		before(:each) do
			get :index, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "has less than 20 items" do
			response_body = JSON.parse(response.body)
			expect(response.body.length).to be <= 20
		end
	end

	describe "GET #show" do
		before(:each) do
			@card_set = FactoryGirl.create :card_set
			get :show, id: @card_set.slug, format: :json
		end
	end

	describe "GET #show_most_popular" do
		before(:each) do
			@card_set_1 = FactoryGirl.create(:card_set, name: "Card Set 1", slug: "card-set-1", impressions_count: 1)
			@card_set_2 = FactoryGirl.create(:card_set, name: "Card Set 2", slug: "card-set-2", impressions_count: 32)
			@card_set_3 = FactoryGirl.create(:card_set, name: "Card Set 3", slug: "card-set-3", impressions_count: 5)
			get :show_most_popular, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "returns the most popular card" do
			response_body = JSON.parse(response.body)
			expect(response_body[0]["name"]).to eq(@card_set_2.name)
		end
	end
end