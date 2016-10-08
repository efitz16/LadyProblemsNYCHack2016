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
      redirect_to @bill
      flash.now[:notice]="Saved. Consider adding bill items to inform others of potential costs."
    else
      render 'new'
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def update
    if @bill.update_attributes(bill_params)
      redirect_to @bill
      flash.now[:notice]="Bill updated."
    else
      render 'edit'
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def destroy
    @bill.destroy
    redirect_to @entry
    flash.now[:notice]="Bill deleted."
  end

  def show
    @bill = current_bill

    if @bill == nil
      redirect_to entry_path(current_entry)
    else
      @user = current_entry.user
      @creator = current_user?(@user)
      @items = @bill.items
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:total_without_coverage, :insurance_company, :policy_name, :final_cost)
  end

  def current_entry
    @entry = Entry.find_by(id: params[:entry_id])
  end

  def entry_creating_bill
    @entry = Entry.find(params[:id])
  end

  def current_bill
    @bill = Bill.find_by(id: params[:id])
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
      flash.now[:notice]="You cannot create or edit a bill for another user."
    end
  end

end
