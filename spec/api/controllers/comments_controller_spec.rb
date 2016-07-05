require "rails_helper"

RSpec.describe CommentsController, type: :controller do
	render_views

	describe "POST #create" do
		before(:each) do
			@card = FactoryGirl.create :card
			post :create, card_id: @card.id, comment: {body: "Comment body", author: "User"}, format: :json
		end

		it "responses successfully with 201 status code" do
			expect(response).to have_http_status(201)
		end

		it "creates a new comment to the card" do
			response_body = JSON.parse(response.body)
			expect(response_body["body"]).to eq("Comment body")
		end
	end

	describe "GET #index" do
		before(:each) do
			@card = FactoryGirl.create :card
			@card.comments.create(body: "This is comment 1", author: "User 1")
			@card.comments.create(body: "This is comment 2", author: "User 2")
			get :index, card_id: @card.id, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "returns all the comments" do
			response_body = JSON.parse(response.body)
			expect(response_body.length).to eq(2)
		end

	end

	describe "PUT #upvote" do
		before(:each) do
			@card = FactoryGirl.create :card
			@comment = @card.comments.create(body: "Comment 1", author: "User")
			@votes = @comment.votes
			put :upvote, card_id: @card.id, id: @comment.id, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "increases the vote count by one" do
			response_body = JSON.parse(response.body)
			expect(response_body["votes"]).to eq(@votes+1)
		end
	end

	describe "PUT #downvote" do
		before(:each) do
			@card = FactoryGirl.create :card
			@comment = @card.comments.create(body: "Comment 1", author: "User")
			@votes = @comment.votes
			put :downvote, card_id: @card.id, id: @comment.id, format: :json
		end

		it "responses successfully with 200 status code" do
			expect(response).to have_http_status(200)
		end

		it "decreases the vote count by one" do
			response_body = JSON.parse(response.body)
			expect(response_body["votes"]).to eq(@votes+1)
		end
	end
end