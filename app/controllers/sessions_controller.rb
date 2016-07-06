class SessionsController < ApplicationController
  skip_before_action :authenticate_user
 
  def create
    instagram = InstagramService.new
    session[:token] = instagram.authenticate(ENV['instagram_client_id'], ENV['instagram_client_secret'], params[:code])
    redirect_to root_path
  end
end
