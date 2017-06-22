class FriendshipsController < ApplicationController

  def new
    @users = current_user.strangers_list
  end

  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id])
    if @friendship.save
      flash[:success] = "You have been add new friend"
      redirect_to new_friendship_path
    else
      flash[:error] = "There is error occurred"
      redirect_to new_friendship_path
    end
  end

  def destroy

  end
end
