class EntriesController < ApplicationController
  before_action :log_in, except: [:index, :show]
  before_action :current_entry, except: [:index, :new, :create]
  before_action :redirect, only: [:edit, :update, :destroy]

  def index
    @recent_entries = Entry.order(created_at: :desc)
  end

  def new
    @entry = current_user.entries.new
  end

  def edit

  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to @entry
      flash.now[:notice]="Saved. Consider adding your cost information."
    else
      render 'new'
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def update
    if @entry.update_attributes(entry_params)
      redirect_to current_user
      flash.now[:notice]="Entry updated."
    else
      render 'edit'
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def destroy
    @entry.destroy
    redirect_to current_user
    flash.now[:notice]="Entry deleted."
  end

  def show
    @entry = current_entry

    if @entry == nil
      redirect_to root_path
    else
      @user = @entry.user
      @bills = @entry.bills
      @creator = current_user?(@user)
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:procedure_name, :city, :state, :details, :facility_name, :year)
  end

  def current_entry
    @entry = Entry.find_by(id: params[:id])
  end

  def log_in
    if !current_user
      redirect_to new_user_session_path,
      flash.now[:notice]="Please login to access this feature."
    end
  end

  def redirect
    unless current_user == @entry.user
      redirect_to new_user_session_path,
      flash.now[:notice]="You cannot create or edit an entry for another user."
    end
  end
end
