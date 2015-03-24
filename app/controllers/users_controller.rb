class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "Not your profile, no changes made."
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile details edited!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = "Not your profile, cannot delete."
      redirect_to users_path
    else
      session[:user_id] = nil
      @user.destroy
      flash[:notice] = "Record destroyed!"
      redirect_to "/"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
