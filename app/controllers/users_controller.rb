class UsersController < ApplicationController
  def index
    @users = current_user.strangers_list
    @friends = current_user.friends
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)  
    end
end
