class BillsController < ApplicationController
  before_action :log_in, :redirect, except: [:show]
  before_action :current_entry, except: [:new, :create]
  before_action :current_bill, only: [:show, :edit, :update, :destroy]
  before_action :entry_creating_bill, only: [:new, :create]

  def new
    @bill = @entry.bills.new
  end

  def create
    @bill = @entry.bills.new(bill_params)
    if @bill.save
      redirect_to "/bills/#{@bill.id}"
      #links to new bill
    else
      # refresh
      # alert: "Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def update
    if @bill.update_attributes(bill_params)
      redirect_to @entry
    end
  end

  def destroy
    @bill.destroy
    redirect_to @entry
  end

  private

  def bill_params
    params.require(:bill).permit(:total_without_coverage, :insurance_company, :policy_name, :final_cost)
  end

  def current_entry
    @entry = Entry.find(params[:entry_id])
  end

  def entry_creating_bill
    @entry = Entry.find(params[:id])
  end

  def current_bill
    @bill = Bill.find(params[:id])
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
      alert: "You cannot create or edit a bill for another user."
    end
  end

end
