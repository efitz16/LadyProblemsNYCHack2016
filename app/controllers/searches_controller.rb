class SearchesController < ApplicationController
	def index
	end

	def new
		@results = Entry.search(params["search"])
		@results = @results.paginate(:page => params[:page], :per_page => 6)
	end

<<<<<<< HEAD
	def data
		respond_to do |format|
			format.json {
				render :json => [1,2,3,4,5]
			}
		end
	end


end
=======
	def customize
		binding.pry
		@results = Entry.search(params["query"])

		if params[:insurance]
			Entry.search_insurance(@results)
		elsif params[:price]

		elsif params[:distance]
			
		end


	end
end
>>>>>>> halfway done with form for customization
