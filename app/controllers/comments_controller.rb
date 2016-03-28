class CommentsController < ApplicationController
	def create
		@card = Card.find(params[:card_id])
		@comment = @card.comments.create(comment_params)
	end

	def index
		@card = Card.find(params[:card_id])
		puts @card.comments.count
		@comments = @card.comments
	end

	def upvote
		Comment.increment_counter(:votes, params[:id])
	end

	def downvote
		Comment.decrement_counter(:votes, params[:id])
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end
