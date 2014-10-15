class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @timeline = current_user.timeline
  end
end
