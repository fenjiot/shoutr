class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @shout = Shout.new
    @shouts = Shout.all
  end

  def create
    current_user.shouts.create(shout_params)

    redirect_to shouts_path
  end

  private

  def shout_params
    params.require(:shout).premit(:body)
  end
end
