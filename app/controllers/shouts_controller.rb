class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @shout = Shout.new
    @timeline = current_user.timeline
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
