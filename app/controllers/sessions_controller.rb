class SessionsController < ApplicationController
  skip_before_action :authenticate_user
 
  def create
    resp = Faraday.post("https://api.instagram.com/oauth/access_token") do |req|
      req.body = "client_id=#{ENV['instagram_client_id']}&client_secret=#{ENV['instagram_client_secret']}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth"
    end
    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
