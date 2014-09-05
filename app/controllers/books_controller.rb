class BooksController < ApplicationController
	def index
		@available_at=Time.now
		@books=["AtlasShrugged","Ender'sGame","Hamlet","TheHobbit"]

	end
end 