class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @shout = Shout.new
    @shouts = Shout.all.order("created_at DESC")
    @users_i_follow = current_user.followed_users
    @users_i_do_not_follow = User.where.not(id: current_user.followed_user_ids)
    @following_relationship = FollowingRelationship.new
  end

  def create
    current_user.shouts.create(shout_params)

    redirect_to shouts_path
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
