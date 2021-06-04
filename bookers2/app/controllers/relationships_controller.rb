class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_back fallback_location: root_url
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back fallback_location: root_url
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

end
