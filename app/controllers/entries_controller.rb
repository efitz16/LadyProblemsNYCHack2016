class EntriesController < ApplicationController
  before_action :log_in, except: [:index, :show]
  before_action :redirect, only: [:create, :update, :destroy]
  before_action :current_entry, except: [:index, :new, :create]

  def index
    @recent_entries = Entry.order(created_at: :desc)
  end

  def new
    @entry = current_user.entries.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to "/entries/#{@entry.id}"
      #links to new bill
    else
      # refresh
      # alert: "Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def update
    if @entry.update_attributes(entry_params)
      redirect_to current_user
    end
  end

  def destroy
    @entry.destroy
    redirect_to current_user
  end

  private

  def entry_params
    params.require(:entry).permit(:procedure_name, :city, :state, :details, :year)
  end

  def current_entry
    @entry = Entry.find(params[:id])
  end

  def log_in
    if !current_user
      redirect_to new_user_session_path,
      alert: "Please login to access this feature."
    end
  end

  def redirect
    unless current_user == @entry.user
      redirect_to new_user_session_path,
      alert: "You cannot create or edit an entry for another user."
    end
  end

	def show
	end
end
