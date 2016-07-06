class MediaController < ApplicationController
  def index
    resp = Faraday.get("https://api.instagram.com/v1/tags/puppies/media/recent?access_token=#{session[:token]}")
    @posts = JSON.parse(resp.body)["data"]
  end
end
