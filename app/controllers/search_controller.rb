class SearchController < ApplicationController
	def search
		if params[:q].blank?
			@results = []
		else
			@results = Elasticsearch::Model.search(params[:q], [CardSet, Card])
		end
	end
end
