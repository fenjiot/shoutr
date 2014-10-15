class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @text_subject = TextSubject.new
    @timeline = current_user.timeline
  end
end
