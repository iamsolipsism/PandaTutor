class SearchController < ApplicationController
	def index
	end
	def show
	 	# @search = Search.find(params[:id])
	end
	def create
		@search = Search.new(params[:search].permit(:class, :uni, :grade))
	end

end
