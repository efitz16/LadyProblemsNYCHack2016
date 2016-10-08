class SearchesController < ApplicationController
	def index

		@results = Entry.search(params["search"])
	end
end

 
# put this in view where want to search
  	# <div class="form-group" id="search-form">
   #    <%= render 'searches/search' %>
   #  </div>