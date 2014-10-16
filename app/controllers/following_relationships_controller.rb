class FollowingRelationshipsController < ApplicationController
  def create
    user_to_follow = User.find_by_username(params[:user_id])
    current_user.follow(user_to_follow)

    redirect_to :back
  end

  def destroy
    user_to_unfollow = User.find_by_username(params[:user_id])
    current_user.unfollow(user_to_unfollow)

    redirect_to :back
  end

  private

  def following_relationship_params
    params.require(:following_relationship).permit(:user_id)
  end
end
