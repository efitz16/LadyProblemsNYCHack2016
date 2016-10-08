class UsersController < ApplicationController
  before_action :auth_user, only: [:edit, :update, :destroy, :show]

  def new
    if logged_in?
      flash[:notice]="Please logout to register a new user."
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash.now[:notice]="User updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    log_out
    User.find_by(id: params[:id]).destroy
    redirect_to root_url
  end

  private

  def auth_user
    if !logged_in?
      flash.now[:notice]="Please log in."
      redirect_to login_url
    else
      @user = User.find_by(id: params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :city, :state, :insurance_company, :policy_name, :bio, :medical_professional, :race, :birthday)
  end


end
