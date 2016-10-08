class SearchesController < ApplicationController
	def index
	end

	def new
		@results = Entry.search(params["search"])
		@results = @results.paginate(:page => params[:page], :per_page => 6)
	end
end