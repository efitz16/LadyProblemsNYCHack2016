class SearchesController < ApplicationController
  def index
  end

  def new
  	@results = Entry.search(params["search"])
  	@results = @results.paginate(:page => params[:page], :per_page => 6)
		
	if !(@results.empty?)
	  @min_max = @results.map { |result| result.total_cost }
	  @min_max = @min_max.minmax
	end

	end

  def data
    respond_to do |format|
    	format.json {
    		render :json => [1,2,3,4,5]
    	}
    end
  end

  def customize
    @results = Entry.search(params["query"])

	@new_results = []

	if params[:insurance]
	  @results.each do |result| 
	  	@new_results << result.bills.where(insurance_company: current_user.insurance_company)
	  	@new_results = @new_results.flatten
	  end
	end

	if params[:price]
	  if !@new_results.empty?

	  else

	  end
	end

	if params[:distance]
			# binding.pry
      if !@new_results.empty?
        @results1 = @new_results
        @new_results = @new_results.select { |result| result.city = current_user.city }
        @new_results << @results1.select { |result| result.state = current_user.state && !(@new_results.include?(result)) }
	  else
		@new_results = @results.select { |result| result.city = current_user.city }
		@new_results << @results.select { |result| result.state = current_user.state && !(@new_results.include?(result)) }
	  end

	  @new_results = @new_results.flatten
	end

	@results = @new_results
	@results = @results.paginate(:page => params[:page], :per_page => 6)

	render 'new'
			
  end

end
