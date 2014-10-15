class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @timeline = current_user.timeline.page(params[:page]).per(5)
  end
end
