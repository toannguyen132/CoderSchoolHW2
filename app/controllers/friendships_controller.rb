class FriendshipsController < ApplicationController

  def new
    @users = current_user.strangers_list
    @friends = current_user.friends
  end

  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id])
    if @friendship.save
      flash[:success] = "You have been add new friend"
      redirect_to users_path
    else
      flash[:error] = "Sorry, There is error occurred"
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find_by(friend_id: params[:id])

    if @friendship.destroy
      flash[:success] = "You have remove someone from friend list"
      redirect_to users_path
    else
      flash[:success] = "Sorry, There is error occurred"
      redirect_to users_path
    end
  end
end
