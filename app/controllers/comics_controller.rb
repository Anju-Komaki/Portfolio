class ComicsController < ApplicationController
	def index
		@comics = Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
	end
end
