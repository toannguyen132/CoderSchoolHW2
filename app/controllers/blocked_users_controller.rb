class BlockedUsersController < ApplicationController
  def create
    blocked_user = current_user.blocked_users.build(blocked_user_id: params[:user_id])

    if blocked_user.save
      return_success "You have successfully blocked a user"
    else
      return_error "Opps, There is an error occurred, please try again"
    end
  end

  def destroy
    blocked_user = current_user.blocked_users.find_by(blocked_user_id: params[:id])
    if !blocked_user.present?
      return_error "Opps, you didn't block this user before"
    end

    if blocked_user.destroy
      return_success "You have unblocked a user"
    else
      return_error "Opps, you didn't block this user before"
    end
  end

  private
  def return_error(message)
    flash[:error] = message
    redirect_to users_path
  end

  def return_success(message)
    flash[:success] = message
    redirect_to users_path
  end
end
