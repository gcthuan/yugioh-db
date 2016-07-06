require "rails_helper"

RSpec.describe SearchController, type: :controller do
	render_views

	describe "GET #search" do

		it "returns 0 result if the input is empty" do
			get :search, format: :json
			response_body = JSON.parse(response.body)
			expect(response_body).to be_empty
		end

		it "returns result contain the input word" do
			get :search, q: "Dragon", format: :json
			response_body = JSON.parse(response.body)
			expect(response_body[0]["name"]).to include("Dragon")
		end
	end
end