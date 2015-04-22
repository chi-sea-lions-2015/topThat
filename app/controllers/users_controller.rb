class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to @user
    else
      render "edit"
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy!
  # end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar, :about_me)
  end

end
