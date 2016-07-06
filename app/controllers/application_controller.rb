class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private
    def authenticate_user
      client_id = ENV['instagram_client_id']
      redirect_uri = "http://localhost:3000/auth"
      instagram_url = "https://api.instagram.com/oauth/authorize/?client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code&scope=public_content"
      redirect_to instagram_url unless logged_in?
    end

    def logged_in?
      !!session[:token]
    end
end
