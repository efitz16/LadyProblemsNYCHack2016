class ItemsController < ApplicationController
  before_action :log_in, except: [:show]
  before_action :current_item, only: [:show, :edit, :update, :destroy]
  before_action :not_nested_bill, only: [:new, :create]
  before_action :current_bill, except: [:new, :create]
  before_action :redirect, except: [:show]

  def new
    @item = @bill.items.new
  end

  def create
    @item = @bill.items.new(item_params)
    if @item.save
      redirect_to @bill
      flash.now[:notice]="Item saved."
    else
      render 'new'
      # redirect_back(fallback_location: fallback_location)
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @bill
      flash.now[:notice]="Item updated."
    else
      render 'edit'
      flash.now[:notice]="Sorry! Something went wrong. Please check that you've filled out all required information."
    end
  end

  def destroy
    @item.destroy
    redirect_to @bill
    flash.now[:notice]="Item deleted."
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :quantity)
  end

  def current_bill
    @bill = @item.bill
  end

  def not_nested_bill
    @bill = Bill.find_by(id: params[:bill_id])
  end

  def current_item
    @item = Item.find(params[:id])
  end

  def log_in
    if !current_user
      redirect_to root_path
      flash.now[:notice]="Please login to access this feature."
    end
  end

  def redirect
    unless current_user == @bill.entry.user
      redirect_to root_path
      flash.now[:notice]="You cannot create or edit an item for another user."
    end
  end

end
