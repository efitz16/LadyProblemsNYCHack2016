class SearchesController < ApplicationController
	def index
	end

	def new
		@results = Entry.search(params["search"])
		@results = @results.paginate(:page => params[:page], :per_page => 6)
	end

	def data
		respond_to do |format|
			format.json {
				render :json => [1,2,3,4,5]
			}
		end
	end


end
