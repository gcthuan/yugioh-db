require "rails_helper"

RSpec.describe CardsController, type: :controller do
	render_views
	describe "GET #index" do
		before(:each) do
			get :index, format: :json
		end
		it "responses successfully with 200 status code" do
			expect(response).to be_success
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
end