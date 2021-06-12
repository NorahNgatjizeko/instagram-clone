class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # I will write the process
    else
      render :new
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  def show
    @user = User.find(params[:id])
  end
  end
end
