class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :update]

  def show
    @user = User.find params[:id]
  end

  def new
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
