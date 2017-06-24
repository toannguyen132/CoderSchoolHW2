class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if !@user.nil? && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to messages_path
    else
      render new
    end
  end

  def callback
    if user = User.from_omniauth(request.env["omniauth.auth"])

      user.assign_attributes(password: '1', password_confirmation: "1", name: request.env["omniauth.auth"][:info][:name])
      user.save!
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully via facebook"
      redirect_to messages_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end
