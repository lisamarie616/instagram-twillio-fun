class MediaController < ApplicationController
  def index
    instagram = InstagramService.new
    @posts = instagram.posts(session[:token])
  end
end
