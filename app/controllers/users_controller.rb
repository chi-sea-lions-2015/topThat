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
    puts params
    if user_params[:password] == params[:user][:password_confirmation]

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        # Tell the UserMailer to send a welcome email after save
        AlertMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(user_path(@user))}
        format.json { render json: @user, status: :created, location: @user }
      else
        flash[:error] = "oops. Turns out you don't know how to signup for anything."
        format.html { redirect_to(root_url)}
        format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
        flash[:error] = "oops. Turns out you don't know how to signup for anything."
        redirect_to root_path
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
