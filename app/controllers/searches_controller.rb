class SearchesController < ApplicationController
  def show
    query = params[:query]
    emails = User.where("email ILIKE ?", "%#{query}%")

    texts = TextSubject.where("body ILIKE ?", "%#{query}%")
    text_shouts = texts.map { |subject| subject.shout }

    images = ImageSubject.where("url ILIKE ?", "%#{query}%")
    image_shouts = images.map { |subject| subject.shout }

    @results = emails + text_shouts + image_shouts
  end
end
